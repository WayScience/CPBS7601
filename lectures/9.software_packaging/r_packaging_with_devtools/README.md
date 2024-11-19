# Packaging Tutorial: Using devtools, usethis, and roxygen2

This tutorial introduces R package development using a combination of devtools, usethis, and roxygen2.
These tools simplify the process of creating, documenting, and maintaining R packages, making it easier to share your code with others and publish it to CRAN or GitHub.

## Overview of the Tools

- [devtools:](https://devtools.r-lib.org/) Simplifies many aspects of R package development, such as installing, building, and checking packages. It is a wrapper around several tools, streamlining the process.
- [usethis:](https://usethis.r-lib.org/) Automates the setup of package files and structure, including version control integration, setting up continuous integration, and managing project metadata.
- [roxygen2:](https://roxygen2.r-lib.org/) Makes documenting R packages easy by allowing inline documentation in your code, which it then converts into NAMESPACE and .Rd files.

## Installation Instructions

Before you can begin developing R packages, you need to install the necessary tools. You can install them from CRAN using the following commands:

```r
install.packages("devtools")
install.packages("usethis")
install.packages("roxygen2")
```

You may also decide to use an environment manager like renv or conda to manage your R environment and dependencies.

## Getting Started

**We provide an R script, which describes similar steps below, which you can directly copy and paste to learn these steps with a hands-on approach.**

Once the packages are installed, you can follow these steps to start developing your own R package.

### Step 1: Create a new package:

You can use usethis to create the structure of your new package. This command will set up the basic files and folders for your package:

```r
# Inside an R script or R console
usethis::create_package("path/to/your/package")
```

This creates the package folder with an R/ directory for your R scripts, a DESCRIPTION file (containing metadata), and other necessary components.

### Step 2: Add and document your functionality:

Inside the R/ directory, you can create .R files that will hold your functions. 
Each function should be documented using roxygen2 syntax.

roxygen2 allows you to write documentation directly above each function.
Here's an example of what your function with documentation might look like:

```r
#' Add two numbers
#'
#' This function adds two numbers together and returns the result.
#' 
#' @param x A numeric value.
#' @param y A numeric value.
#' @return The sum of `x` and `y`.
#' @export
add_numbers <- function(x, y) {
  return(x + y)
}
```

After writing the documentation, run the following command to generate the NAMESPACE file and .Rd files for the help pages:

```r
devtools::document()
```

### Step 3: Set up version control:

If your package is in a GitHub repository, you can link it to version control and GitHub easily with usethis:

```r
usethis::use_git()
usethis::use_github()
```

If your package depends on other R packages, use usethis to declare them in the DESCRIPTION file.
For example, to add ggplot2 as a dependency, use:

```r
usethis::use_package("ggplot2")
```

However, this does not automatically make these packages available to your function!
To allow your function to access these, use @import within the roxygen2 documentation. 

```r
#' Function that needs ggplot2
#' @import ggplot2
```

### Step 4: Test install and package loading locally:

To install and load your package locally during development, use the following command:

```r
devtools::install()
library(yourpackagename)
```

Ensure your package is ready for sharing by running checks using devtools.
This step checks for common issues and ensures that your package follows CRAN standards:

```r
devtools::check()
```

### Step 5: Build and distribute your package:

Once you're ready to distribute your package, you can build it using:

```r
devtools::build()
```

This creates a .tar.gz file that you can share with others or upload to CRAN.
If you want to release the package on GitHub, simply push your repository to GitHub and create a release:

```r
usethis::use_github_release()
```

By following these steps, you’ll have a fully functional R package ready for use, testing, and distribution.
For more advanced usage, refer to the documentation of devtools, usethis, and roxygen2.
