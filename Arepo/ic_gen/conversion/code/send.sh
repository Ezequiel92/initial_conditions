#!/bin/bash

mkdir --mode=744 -p ../build 
mkdir --mode=744 -p ../output

chmod -R 744 ../code

export SYSTYPE=FREYA

if [ ${HOSTNAME::-2} = "raven" ] || [ ${HOSTNAME::-2} = "freya" ]; then
	module --silent purge
    module --silent load gcc/11 
    module --silent load openmpi
    module --silent load gsl
    module --silent load fftw-mpi
    module --silent load hdf5-mpi/1.12.1
fi

make -j8 CONFIG=./Config.sh BUILD_DIR=../build EXEC=../build/Arepo

if [ $? -eq 0 ]; then
    sbatch ./slurm_job.sh $1
fi
