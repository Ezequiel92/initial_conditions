#!/bin/bash

#SBATCH --job-name=arepo_sim
#SBATCH --output=../output/stdout_%j    
#SBATCH --error=../output/stderr_%j     
#SBATCH --mail-user=lozano@mpa-garching.mpg.de
#SBATCH --mail-type=ALL,TIME_LIMIT_90
#SBATCH --time=24:00:00
#SBATCH --no-requeue

# Total number of threads = nodes * ntasks-per-node

# Number of nodes
#SBATCH --nodes=1

# Number of MPI tasks per node
#SBATCH --ntasks-per-node=8

# Memory per node in megabytes
#SBATCH --mem=16000

mpiexec -np $SLURM_NPROCS ../build/Arepo param.txt

if [ $? -eq 0 ]; then
    filename="${1##*/}"
    mv -f $1-with-grid.hdf5 ./output/${filename%.*}.hdf5
    rm -rf ./build ./code/param.txt-usedvalues ./code/WARNINGS ./code/uses-machines.txt
fi
