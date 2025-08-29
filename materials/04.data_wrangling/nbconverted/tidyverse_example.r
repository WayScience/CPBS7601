suppressPackageStartupMessages(library(dplyr))
suppressPackageStartupMessages(library(readr))
suppressPackageStartupMessages(library(ggplot2))

# Set constants and paths
figshare_base_url <- "https://figshare.com/ndownloader/files/"

drug_screen_file_id <- "46630984"
drug_id_file_id <- "46630981"
cellline_file_id <- "46630978"

# Set output file paths
output_directory <- "results"
ttest_results_file <- file.path(output_directory, "ttest_results_tidyverse.csv")
volcano_plot_file <- file.path(output_directory, "volcano_plot_tidyverse.png")

# Load drug screen data
drug_screen_results_df <- readr::read_csv(
    paste0(figshare_base_url, drug_screen_file_id),
    show_col_types = FALSE
    )

# Explore the data
print(dim(drug_screen_results_df))
head(drug_screen_results_df, 3)

# Load compound identifier metadata
compound_id_df <- readr::read_csv(
    paste0(figshare_base_url, drug_id_file_id),
    col_types = readr::cols(
        screen = readr::col_character(),
        repurposing_target = readr::col_character(),
        MOA = readr::col_character(),
        IDs = readr::col_character(),
        Drug.Name = readr::col_character(),
        Synonyms = readr::col_character(),
        dose = readr::col_double()
        )
    )

# Explore the data
print(dim(compound_id_df))
head(compound_id_df, 3)

# Load compound identifier metadata
cellline_id_df <- readr::read_csv(
    paste0(figshare_base_url, cellline_file_id),
    col_types = readr::cols(
        .default = readr::col_character()
    )
)

# Explore the data
print(dim(cellline_id_df))
head(cellline_id_df, 3)

## Step 1 - Rename column 1
drug_screen_results_df <- drug_screen_results_df %>%
  dplyr::rename("BRD_ID" = `...1`)

## Step 2 - Select drugs with known MOA
compounds_with_known_MOA <- compound_id_df %>%
    dplyr::filter(!is.na(MOA)) %>%
    dplyr::pull(IDs)

# Step 3 - Filter drug screen data to only include compounds with known MOA
drug_screen_results_df <- drug_screen_results_df %>%
    dplyr::filter(BRD_ID %in% compounds_with_known_MOA)

# Step 4 - Split cell line column to separate name from cancer type
# and keep only certain columns
cellline_id_df <- cellline_id_df %>%
  tidyr::separate(
    ccle_name,
    into = c("cell_line", "cancer_type"),
    sep = "_",
    extra = "merge"
    ) %>%
  dplyr::select(cell_line, cancer_type, depmap_id) %>%
  dplyr::distinct()

# Step 5 - Remove screen and dose columns in drug id data
compound_id_df <- compound_id_df %>%
  dplyr::select(-screen, -dose) %>%
  dplyr::distinct()

# Filter drug screen data to only include data from pancreatic and liver cancers
select_cancer_types <- c("PANCREAS", "LIVER")

select_cancer_depmap_ids <- cellline_id_df %>%
  dplyr::filter(cancer_type %in% !!select_cancer_types) %>%
  dplyr::pull(depmap_id)

drug_screen_results_df <- drug_screen_results_df %>%
    dplyr::select("BRD_ID", !!select_cancer_depmap_ids)

print(dim(drug_screen_results_df))
head(drug_screen_results_df, 3)

# Pivot wide data to long data
drug_screen_results_long_df <- drug_screen_results_df %>%
    tidyr::pivot_longer(
        cols = !BRD_ID,
        names_to = "ach_cell_line_id",
        values_to = "response"
        )

print(dim(drug_screen_results_long_df))
head(drug_screen_results_long_df, 3)

# Join cell line metadata and drug identifiers
drug_screen_results_long_df <- drug_screen_results_long_df %>%
    dplyr::left_join(cellline_id_df, by = c("ach_cell_line_id" = "depmap_id")) %>%
    dplyr::left_join(compound_id_df, by = c("BRD_ID" = "IDs")) %>%
    dplyr::distinct()

print(dim(drug_screen_results_long_df))
head(drug_screen_results_long_df, 3)

# Identify all unique MOAs
unique_MOAs <- unique(drug_screen_results_long_df$MOA)

length(unique_MOAs)

# Calculate t-test for each MOA across pancreatic and liver cancers
ttest_results <- list()
for (moa in unique_MOAs) {
    # Isolate specific moa
    specific_moa_drug_screen_results_long_df <- drug_screen_results_long_df %>%
        dplyr::filter(MOA == !!moa)
    
    # Collect specific responses according to cancer type
    pancreatic_response <- specific_moa_drug_screen_results_long_df %>%
        dplyr::filter(cancer_type == "PANCREAS") %>%
        dplyr::pull(response)

    liver_response <- specific_moa_drug_screen_results_long_df %>%
        dplyr::filter(cancer_type == "LIVER") %>%
        dplyr::pull(response)

    # Calculate t-test
    t_test_result <- t.test(
        pancreatic_response,
        liver_response,
        alternative = "two.sided",
        var.equal = FALSE
        )

    # Store results
    ttest_results[[moa]] <- c(
        "moa" = moa,
        "test_statistic" = t_test_result$statistic,
        "p_value" = t_test_result$p.value
        )
}

# Combine results into a data frame
ttest_results_df <- data.frame(do.call(rbind, ttest_results)) %>%
    dplyr::arrange(desc(test_statistic.t))

# Convert column types
ttest_results_df$test_statistic.t <- as.numeric(ttest_results_df$test_statistic.t)
ttest_results_df$p_value <- as.numeric(ttest_results_df$p_value)

# Output results
ttest_results_df %>% readr::write_csv(ttest_results_file)

print(dim(ttest_results_df))
head(ttest_results_df, 5)

# Visualize results
bonferroni_adjusted_value <- 0.05 / dim(ttest_results_df)[1]

volcano_gg <- (
    ggplot(
        data = ttest_results_df,
        aes(x = test_statistic.t, y = -log10(p_value))
        )
    + geom_point(size = 0.5)
    + geom_hline(
        yintercept = -log10(bonferroni_adjusted_value),
        linetype = "dashed",
        color = "red"
        )
    + labs(x = "T statistic", y = "-log10(p-value)")
    + theme_bw()
    + theme(
        axis.title = element_text(size = 14),
        axis.text = element_text(size = 12)
        )
)

# Save plot
ggsave(volcano_plot_file, dpi = 400, width = 4, height = 4)

volcano_gg
