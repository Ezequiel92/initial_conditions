#!/bin/bash 

mkdir --mode=764 -p ./build 
mkdir --mode=764 -p ./output

chmod -R 764 ./code

make -C code -j8 CONFIG=./Config.sh BUILD_DIR=../build EXEC=../build/Arepo

sed -i "s#^InitCondFile.*#InitCondFile                            $1#" ./code/param.txt

mpiexec -np 8 ./build/Arepo ./code/param.txt

filename="${1##*/}"
mv -f $1-with-grid.hdf5 ./output/${filename%.*}.hdf5

rm -rf ./build ./code/param.txt-usedvalues ./code/WARNINGS ./code/uses-machines.txt
