#!/bin/bash

#SBATCH --job-name=GalIC
#SBATCH --output=../output/stdout_%j    
#SBATCH --error=../output/stderr_%j    
#SBATCH --mail-user=lozano@mpa-garching.mpg.de
#SBATCH --mail-type=ALL,TIME_LIMIT_90
#SBATCH --time=06:00:00
#SBATCH --no-requeue

# Total number of threads = nodes * ntasks-per-node

# Number of nodes
#SBATCH --nodes=1

# Number of MPI tasks per node
#SBATCH --ntasks-per-node=32

# Memory per node
#SBATCH --mem=16G

mpiexec -np $SLURM_NPROCS ../build/GalIC param.txt

if [ $? -eq 0 ]; then
    mv -f ../output/dm_ic_010.hdf5 ../../conversion/ICs/dm_ic.hdf5
    rm -rf ./param.txt-usedvalues ./WARNINGS ./uses-machines.txt  ./forcetest.dat ../output ../build	
fi
