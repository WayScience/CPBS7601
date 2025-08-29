#!/usr/bin/env python
# coding: utf-8

# # Pandas example - CPBS 7601
# 
# Learn how to interact with tidy data using the `pandas` python package.
# 
# https://pandas.pydata.org/
# 
# 1. Import packages and setup options
# 2. Load data
# 3. Clean data
# 4. Wrangle data
# 5. Outputs
# 
# ## Step 1 - Import packages and setup options

# In[1]:


import pathlib

import numpy as np
import pandas as pd
import plotnine as gg
import scipy.stats as stats


# ### Prepare to load public dataset
# 
# https://figshare.com/articles/dataset/Repurposing_Public_24Q2/25917643/1?file=46630978

# In[2]:


# Set constants and paths
figshare_base_url = "https://figshare.com/ndownloader/files/"

drug_screen_file_id = "46630984"
drug_id_file_id = "46630981"
cellline_file_id = "46630978"

# Set output file paths
output_directory = "results"
ttest_results_file = pathlib.Path(output_directory, "ttest_results_pandas.csv")
volcano_plot_file = pathlib.Path(output_directory, "volcano_plot_pandas.png")


# ## Step 2 - Load the data
# 
# We are loading three different types of data:
# 
# 1. Drug screening viability data
# 2. Drug identifier metadata
# 3. Cell line identifier metadata
# 
# We are accessing this from the [DepMap Drug Repurposing Hub 2024 2Q Data Release](https://figshare.com/articles/dataset/Repurposing_Public_24Q2/25917643/1?file=46630978).

# In[3]:


# Load drug screen data
drug_screen_results_df = pd.read_csv(f"{figshare_base_url}{drug_screen_file_id}")

# Explore the data
print(drug_screen_results_df.shape)
drug_screen_results_df.head(3)


# In[4]:


# Load compound identifier metadata
compound_id_df = pd.read_csv(f"{figshare_base_url}{drug_id_file_id}")

# Explore the data
print(compound_id_df.shape)
compound_id_df.head(3)


# In[5]:


# Load compound identifier metadata
cellline_id_df = pd.read_csv(f"{figshare_base_url}{cellline_file_id}")

# Explore the data
print(cellline_id_df.shape)
cellline_id_df.head(3)


# ## Step 3 - Clean data
# 
# It's extremely rare for a dataset to not need any cleaning.
# 
# Chances are that you will need to fix some column names, isolate certain rows and/or columns for your analysis, remove certain data, and perform other operations to get your data ready for analysis.
# 
# Here, we perform a series of data cleaning operations.
# 
# Note, that we would have done much of this data cleaning upon data loading, but, for instruction, we do it separately here.

# In[6]:


## Step 1 - Rename column 1
drug_screen_results_df = drug_screen_results_df.rename(columns={"Unnamed: 0": "BRD_ID"})

## Step 2 - Select drugs with known MOA
compounds_with_known_MOA = compound_id_df.dropna(subset="MOA").IDs.unique()

# Step 3 - Filter drug screen data to only include compounds with known MOA
drug_screen_results_df = drug_screen_results_df.loc[
    lambda x: x.BRD_ID.isin(compounds_with_known_MOA)
]

# Step 4 - Split cell line column to separate name from cancer type
# and keep only certain columns
cellline_id_df = (
    pd.concat(
        [
            cellline_id_df.drop(columns=["ccle_name"]),
            pd.DataFrame(
                cellline_id_df.ccle_name.str.split("_", n=1).tolist(),
                columns=["cell_line", "cancer_type"],
            ),
        ],
        axis=1,
    )
    .loc[:, ["cell_line", "cancer_type", "depmap_id"]]
    .drop_duplicates()
)

# Step 5 - Remove screen and dose columns in drug id data
compound_id_df = compound_id_df.drop(columns=["screen", "dose"]).drop_duplicates()


# ## Step 4: Wrangle data
# 
# Data are always in an inappropriate form for analysis.
# 
# Wrangling data get data in the correct form so that you can apply statistics and machine learning.

# In[7]:


# Filter drug screen data to only include data from pancreatic and liver cancers
select_cancer_types = ["PANCREAS", "LIVER"]

select_cancer_depmap_ids = cellline_id_df.loc[
    cellline_id_df["cancer_type"].isin(select_cancer_types), "depmap_id"
].tolist()

drug_screen_results_df = drug_screen_results_df.loc[
    :, ["BRD_ID"] + select_cancer_depmap_ids
]

print(drug_screen_results_df.shape)
drug_screen_results_df.head(3)


# In[8]:


# Pivot wide data to long data
drug_screen_results_long_df = drug_screen_results_df.melt(
    id_vars=["BRD_ID"], value_name="response", var_name="ach_cell_line_id"
)

print(drug_screen_results_long_df.shape)
drug_screen_results_long_df.head(3)


# In[9]:


# Join cell line metadata and drug identifiers
drug_screen_results_long_df = (
    drug_screen_results_long_df.merge(
        cellline_id_df, left_on="ach_cell_line_id", right_on="depmap_id", how="left"
    )
    .merge(compound_id_df, left_on="BRD_ID", right_on="IDs", how="left")
    .drop_duplicates()
)

print(drug_screen_results_long_df.shape)
drug_screen_results_long_df.head(3)


# ## Step 5 - Outputs
# 
# We can now analyze the data in any number of ways.
# 
# We show here one example:
# 
# 1. Using a t-test to identifying the most differentially effective MOAs between pancreatic and liver cancers.
#     - [A t-test will tell us if there is a significant difference between the means of two groups](https://www.datacamp.com/tutorial/t-tests-r-tutorial).
# 2. Visualizing the results.

# In[10]:


# Identify all unique MOAs
unique_MOAs = drug_screen_results_long_df.MOA.unique().tolist()

len(unique_MOAs)


# In[11]:


# Calculate t-test for each MOA across pancreatic and liver cancers
ttest_results = []
for moa in unique_MOAs:
    # Isolate specific moa
    specific_moa_drug_screen_results_long_df = drug_screen_results_long_df.query(
        "MOA == @moa"
    )

    # Collect specific responses according to cancer type
    pancreatic_response = (
        (specific_moa_drug_screen_results_long_df.query("cancer_type == 'PANCREAS'"))
        .response.dropna()
        .tolist()
    )

    liver_response = (
        (specific_moa_drug_screen_results_long_df.query("cancer_type == 'LIVER'"))
        .response.dropna()
        .tolist()
    )

    # Calculate t-test
    t_test_result = stats.ttest_ind(
        pancreatic_response, liver_response, nan_policy="omit", equal_var=False
    )

    # Store results
    ttest_results.append([moa, t_test_result.statistic, t_test_result.pvalue])

# Combine results into a data frame
ttest_results_df = (
    pd.DataFrame(ttest_results, columns=["moa", "test_statistic", "p_value"])
    .sort_values(by="test_statistic", ascending=False)
    .reset_index(drop=True)
)

# Convert column types
ttest_results_df.test_statistic.t = ttest_results_df.test_statistic.astype(float)
ttest_results_df.p_value = ttest_results_df.p_value.astype(float)

# Output results
ttest_results_df.to_csv(ttest_results_file, sep=",", index=False)

print(ttest_results_df.shape)
ttest_results_df.head(5)


# In[12]:


# Visualize results
bonferroni_adjusted_value = 0.05 / ttest_results_df.shape[0]

volcano_gg = (
    gg.ggplot(
        ttest_results_df,
        gg.aes(x="test_statistic", y="-np.log10(p_value)"),
    )
    + gg.geom_point(size=0.5)
    + gg.geom_hline(
        yintercept=-np.log10(bonferroni_adjusted_value), linetype="dashed", color="red"
    )
    + gg.labs(x="T statistic", y="-log10(p-value)")
    + gg.theme_bw()
    + gg.theme(axis_title=gg.element_text(size=14), axis_text=gg.element_text(size=12))
)

# Save plot
volcano_gg.save(volcano_plot_file, dpi=400, width=4, height=4)

volcano_gg

