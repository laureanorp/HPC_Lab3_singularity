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
#SBATCH --chdir=/home/alumno17/lab3-container/experiments/data
#SBATCH --output=python_cpp_FULL_eval.out
#SBATCH -J Python_Cpp_FULL_eval
#SBATCH --cpus-per-task=1
#SBATCH --mail-type=NONE   # END/START/NONE
#SBATCH --mail-user=laureano.r.p@um.es

# Run all Python kmer-n scripts from n=6 to n=15
echo "Running k-mers(6 to 15) with Python"
for i in {6..15}
do
	time python ./k-mer"$i".py
done

# Run all C++ kmer-n executables from n=11 to n=20
echo "Running k-mers(11 to 20) with C++"
for i in {11..20}
do
	time ./k-mer"$i"
done
