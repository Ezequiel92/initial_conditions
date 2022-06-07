#!/bin/bash

#SBATCH --job-name=conversion
#SBATCH --output=../output/stdout_%j    
#SBATCH --error=../output/stderr_%j     
#SBATCH --mail-user=lozano@mpa-garching.mpg.de
#SBATCH --mail-type=ALL,TIME_LIMIT_90
#SBATCH --time=02:00:00
#SBATCH --no-requeue

# Total number of threads = nodes * ntasks-per-node

# Number of nodes
#SBATCH --nodes=1

# Number of MPI tasks per node
#SBATCH --ntasks-per-node=1

# Memory per node
#SBATCH --mem=150G

mpiexec -np $SLURM_NPROCS ../build/Arepo param.txt

# Move output files to the correct folder and clean everything else
if [ $? -eq 0 ]; then

    if [ $# -eq 0 ]; then
        mv -f ../ICs/dm_ic-with-grid.hdf5 ../../output/ic.hdf5
        mv -f ../ICs/dm_ic.hdf5 ../../output/ic_dm.hdf5
        mv -f ../output/stdout_* ../../output/ic_stdout.txt
    else
        mv -f ../ICs/dm_ic-with-grid.hdf5 ../../output/${1}.hdf5
        mv -f ../ICs/dm_ic.hdf5 ../../output/${1}_dm.hdf5
        mv -f ../output/stdout_* ../../output/${1}_stdout.txt
    fi

    rm -rf ./param.txt-usedvalues ./WARNINGS ./uses-machines.txt ../ICs ../output ../build
	
fi
