# Note: This script should not be run directly.
# It is intended to be run in an interactive R session.

# Load necessary libraries
library(usethis)
library(devtools)
library(roxygen2)

# Step 1: Create a new package
# Set the path for the new package (adjust the path as needed)
package_path <- "cpbs7601"
dir.create(package_path)

# Create the package
usethis::create_package(package_path)

# Step 2: Set up Git and GitHub (optional, uncomment if you want Git integration)
# usethis::use_git()
# usethis::use_github()

# Step 3: Add a license and README
usethis::use_ccby_license()
usethis::use_readme_md()  # Note, this will open an interactive window for editing

# Step 4: Add a simple function to the package

# Define a function to multiply two numbers
multiply_function <- "
#' Multiply two numbers
#'
#' This function multiplies two numbers together and returns the result.
#'
#' @param a A numeric value.
#' @param b A numeric value.
#' @return The product of `a` and `b`.
#' @export
multiply_numbers <- function(a, b) {
  return(a * b)
}
"

# Write the function to an R script file
setwd("cpbs7601") # Change directories
writeLines(multiply_function, con = "R/multiply_numbers.R")

# Step 4: Document the package (generate NAMESPACE and Rd files)
devtools::document()

# Step 5: Install the package
devtools::install()

# Step 6: Run a basic check on the package
devtools::check()

# Optional: Test the function after installation
library("cpbs7601")
result <- multiply_numbers(2, 3)
print(result)

# Step 7: Build the package (creates a tarball)
devtools::build()

# Step 8: Release the package on GitHub (optional, uncomment to use)
# usethis::use_github_release()
