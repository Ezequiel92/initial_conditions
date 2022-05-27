#!/bin/bash

mkdir --mode=744 -p ../build 
mkdir --mode=744 -p ../output

chmod -R 744 ../code

if [ ${HOSTNAME::-2} = "raven" ] || [ ${HOSTNAME::-2} = "freya" ]; then
	module purge
	module load gcc/9
	module load gsl fftw-serial/3.3.8 hdf5-serial
fi

export SYSTYPE=FREYA
export PATH=/u/vrs/Libs/openmpi-4.0.7/bin:$PATH

sed -i "s#^InitCondFile.*#InitCondFile                            $1#" ./param.txt

make -j8 CONFIG=./Config.sh BUILD_DIR=../build EXEC=../build/Arepo

if [ $? -eq 0 ]; then
    sbatch ./slurm_job.sh $1
fi
