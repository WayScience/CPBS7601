#!/bin/bash

# We are going to demonstrate a simple bash workflow
# We will execute the pandas data wrangling notebook, with a single command

# Step 1: Navigate into the 4.data_wrangling directory
cd ../04.data_wrangling

# Step 2: Confirm that you're using the correct conda environment
# Note: You must first have created the environment (see lectures/3.environments/)
source "$(conda info --base)/etc/profile.d/conda.sh"
conda activate cpbs7601

# Step 3: Execute the pandas example
papermill pandas_example.ipynb /dev/null --kernel python3

# Step 4: Tell us you are done!
echo "Done!"
