#!/bin/bash

mkdir --mode=764 -p ../build 
mkdir --mode=764 -p ../output

chmod -R 764 ../code

export SYSTYPE=FREYA

if [ ${HOSTNAME::-2} = "raven" ] || [ ${HOSTNAME::-2} = "freya" ]; then
	module --silent purge
    module --silent load gcc/11 
    module --silent load openmpi
    module --silent load gsl
    module --silent load fftw-mpi
    module --silent load hdf5-mpi/1.12.1
fi

if [ ${HOSTNAME::-2} = "raven" ]; then
	sed -i "s&^mpiexec -np $SLURM_NPROCS&srun&" ./slurm_job.sh
fi

if [ $# -eq 0 ]; then
    NUMBER=32768
else
    NUMBER=$(( ${1}**3 ))
fi
sed -i "s&^N_HALO.*&N_HALO \t $NUMBER \t % Number of particles in dark halo.&" ./param.txt

make -j8 CONFIG=./Config.sh BUILD_DIR=../build EXEC=../build/GalIC

if [ $? -eq 0 ]; then
    sbatch ./slurm_job.sh
fi
