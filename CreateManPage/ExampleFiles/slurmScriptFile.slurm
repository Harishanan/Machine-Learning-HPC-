#!/usr/bin/env bash
#SBATCH --job-name=python_ml_job
#SBATCH --output=/home/master/python_ml.out  # %j will be replaced with the job ID
#SBATCH --account=root
#SBATCH --partition=debug              # Adjust as needed
#SBATCH --nodes=1-5                      # Number of nodes
#SBATCH --time=01:00:00                # Time limit hh:mm:ss

# Clear the environment from any previously loaded modules
module purge > /dev/null 2>&1

# Load the module environment suitable for the job
module load foss/2019a

# And finally run the job​
srun ./my_mpi_program
