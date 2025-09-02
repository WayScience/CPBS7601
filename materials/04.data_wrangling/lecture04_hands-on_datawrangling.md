# Hands-On Activity #4:

## Comparing T-Test Results from Python and R

### Objective:

Compare the results of a t-test calculated using Python's `scipy.stats.ttest` and R's `t.test` to identify and visualize differences.

### Data:

T-test results comparing drugs that preferentially kill pancreatic vs. lung cancer cells.
Derived using tidyverse and t.test()
https://github.com/WayScience/CPBS7601/raw/refs/heads/main/materials/04.data_wrangling/results/ttest_results_tidyverse.csv
Derived using pandas and scipy.stats.ttest_ind()
https://github.com/WayScience/CPBS7601/raw/refs/heads/main/materials/04.data_wrangling/results/ttest_results_pandas.csv

**Note:** You can load data from URLs directly into your favorite data wrangling tool.

In a jupyter notebook follow the instructions:

### Instructions:

1. Prepare your workspace:

   - Activate the cpbs7601 conda environment
   - Ensure your jupyter kernel is using this environment

1. Load and align the data:

   - Load both files (e.g., using pandas in Python).
   - Note that you can access these files using their URLs (no need to download)
   - Ensure that the dataframes are properly aligned for comparison. Check that the same observations (rows) and variables (columns) are matched between the two dataframes.

1. Identify differences:

   - Calculate the differences between the corresponding values in the two dataframes.
   - Consider differences in the t-statistic, p-values, or any other relevant metrics.
   - Quantify the differences and store the results in a new dataframe.

1. Visualize the differences:

   - Choose a visualization method (e.g., histogram, density plot, boxplot, or heatmap) to represent the differences between the two sets of t-test results.
   - Create the chosen visualization to effectively illustrate the magnitude and distribution of the differences.

1. Analyze the biggest differences:

   - Identify the largest differences in your comparison.
   - Provide an explanation as to why these differences might exist. Consider factors such as numerical precision, algorithmic implementation differences, or other potential causes.

### Deliverables:

- A jupyter notebook html file that includes:
  - A brief description of the two datasets and how they were aligned.
  - The method used to quantify differences between the t-test results.
  - The visualization(s) of the differences.
  - An explanation of the biggest differences and possible reasons for their occurrence.

### Tips:

- Ensure your data is properly aligned before calculating differences.
- Experiment with different types of visualizations to best represent the data.
- Consider both statistical and computational factors that could lead to differences in the results.

### Tools:

- jupyter notebook
- conda
- Use Python libraries such as `pandas`, `matplotlib`, `seaborn`, or `plotly` for data manipulation and visualization.
- Consider using R if you prefer to work with `tidyverse` or `ggplot2` for any part of the analysis.
