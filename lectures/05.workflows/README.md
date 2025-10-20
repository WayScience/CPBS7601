## Two tutorials

### Bash basics

```bash
# To run the notebook, execute in the terminal:
bash example_bash_workflow.sh
```

This is a simple bash workflow that runs the pandas `data_wrangling` notebook.

### Snakemake basics

```bash
# To run the workflow, execute in the terminal:
snakemake --forceall --cores 1
```

This is a simple snakemake workflow that downloads the results of the pandas data wrangling exercise and counts the number of lines in the downloaded file.
