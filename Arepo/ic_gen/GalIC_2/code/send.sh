#!/bin/bash

mkdir --mode=764 -p ../build 
mkdir --mode=764 -p ../output
mkdir --mode=764 -p ../../output
mkdir --mode=764 -p ../../conversion/ICs

chmod -R 764 ../../../ic_gen

if [ ${HOSTNAME::-2} = "raven" ] || [ ${HOSTNAME::-2} = "freya" ]; then
    module purge
    module --silent load gcc/11 
    module --silent load openmpi 
    module --silent load gsl 
    module --silent load fftw-mpi 
    module --silent load hdf5-mpi/1.12.1
fi

if [ ${HOSTNAME::-2} = "raven" ]; then
    export SYSTYPE=RAVEN
	sed -i "s&^mpiexec -np $SLURM_NPROCS&srun&" ./slurm_job.sh
elif [ ${HOSTNAME::-2} = "freya" ]; then
    export SYSTYPE=FREYA
    sed -i "s&^srun&mpiexec -np $SLURM_NPROCS&" ./slurm_job.sh
fi

if [ $# -eq 0 ]; then
    NUMBER="32768"
	HSML="0.3"
else
    NUMBER=$(( ${1}**3 ))
	SCALE=$(( ${1}/32 ))
	if [ $SCALE -eq 1 ]; then
		HSML="0.3"
	elif [ $SCALE -eq 2 ];then
		HSML="0.15"
	elif [ $SCALE -eq 4 ];then
		HSML="0.075"
	elif [ $SCALE -eq 8 ];then
		HSML="0.0375"
	fi
fi

sed -i "s&^N_HALO.*&N_HALO \t\t $NUMBER \t % Number of particles in dark halo.&" ./param.txt
sed -i "s&^SofteningComovingType0.*&SofteningComovingType0 \t\t $HSML&" ../../conversion/code/param.txt
sed -i "s&^SofteningComovingType1.*&SofteningComovingType1 \t\t $HSML&" ../../conversion/code/param.txt
sed -i "s&^SofteningMaxPhysType0.*&SofteningMaxPhysType0 \t\t $HSML&" ../../conversion/code/param.txt
sed -i "s&^SofteningMaxPhysType1.*&SofteningMaxPhysType1 \t\t $HSML&" ../../conversion/code/param.txt

make -j8 CONFIG=./Config.sh BUILD_DIR=../build EXEC=../build/GalIC

if [ $? -eq 0 ]; then
    sbatch ./slurm_job.sh
fi
