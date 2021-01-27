#!/bin/bash

# NOTE:
# --cpus-per-task parameter controls the number of
# cpus needed to run the current job.
#
# If your application runs sequentially, please set
# --cpus-per-task=1
# If you need to reserve the full node, please set
# --cpus-per-task=32

#SBATCH -p hpc-bio-pacioli
#SBATCH --chdir=/home/alumno17/lab3-container/data
#SBATCH --output=python_cpp_singularity_eval.out
#SBATCH -J Sing_Python_Cpp_eval
#SBATCH --cpus-per-task=1
#SBATCH --mail-type=NONE   # END/START/NONE
#SBATCH --mail-user=laureano.r.p@um.es

# Run k-mer13 with Python
echo "Running k-mer13 with Python on Singularity"
time ../singularity/python_latest.sif python ./k-mer13.py

# Run k-mer13 with C++
echo "Running k-mer13 with C++ on Singularity"
time ../singularity/python_latest.sif ./k-mer13

# Run k-mer14 with Python
echo "Running k-mer14 with Python on Singularity"
time ../singularity/python_latest.sif python ./k-mer14.py

# Run k-mer14 with C++
echo "Running k-mer14 with C++ on Singularity"
time ../singularity/python_latest.sif ./k-mer14
