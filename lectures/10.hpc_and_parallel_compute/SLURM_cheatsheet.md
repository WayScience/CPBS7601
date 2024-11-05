# Slurm Guide

For bash scripts, this line should be the first line of code in every script
```
#!/bin/bash  # Shebang slash bin slash bash
```

Next are the SBATCH directives that tell slurm scheduler how to handle your job.
These directives should be at the top of your script, but under the shebang line.

### Frequent SLURM directives
```
#SBATCH --job-name=parallel_job # job name
#SBATCH -t 1-23:59:59   # D-HH-MM-SS
#SBATCH -t 59           # MM
#SBATCH -t 59:59        # MM:SS
#SBATCH -t 59:59:59     # HH:MM:SS
#SBATCH -t 1-23         # D-HH
#SBATCH -t 1-23:59      # D-HH-MM
#SBATCH --mem=16G       # 16 Gigabytes
#SBATCH --output=out_%j.log
#SBATCH --ntasks     # number of tasks
#SBATCH --mail-type=NONE, BEGIN, END, FAIL, ALL   # email events
#SBATCH --mail-user=email@ufl.edu
```
### Slurm Commands
#### Environment modules
```
module purge # removes all modules
module avail # lists all modules availble for loading
module list # list all currently loaded modules
module load # loads module (hint: us the tab key to autocomplete)
```
#### Submitting a job
```
sbatch script.sh  # submit script.sh
```
#### Checking job status
```
squeue -u {User}  # check submitted jobs in queue
```
#### Canceling a job or all jobs
```
scancel {jobid}  # Cancel job
scancel -u {User}  # Cancel all jobs for user
```
#### Check job details
```
jobstats $USER {days} # Check job stats for user for the last {days}
```
#### Check job efficiency
```
seff {jobid}
```
#### Check fairshare
```
module load slurmtools
levelfs $USER
```
#### Check user and institution account billings
```
suuser $USER
suacct amc-general
```

#### Example SBATCH
```
#!/bin/bash
#SBATCH --job-name=Slurm_job    # job name "slurm_job"
#SBATCH -t 1-23         # Time 1 day, 23 hours
#SBATCH --mem=16G       # 16 Gigabytes of RAM
#SBATCH --output=out_%j.log          # std output/error file

#SBATCH --mail-type=END,FAIL       # send email on job end/fail
#SBATCH --mail-user=email@ufl.edu  # send email to this address

module load python/3.9.6
module list
```
