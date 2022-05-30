# Initial conditions generator

## Codes

- GalIC: Version 1.0 of GalIC from [Yurin et al. (2014)](https://www.h-its.org/2014/11/05/galic-code/).
- GalIC_2: Version 1.1 of GalIC from [this repo](https://github.com/denisyurin/GALIC).
- conversion: Public [Arepo](https://gitlab.mpcdf.mpg.de/vrs/arepo) set up to transform ICs to the Arepo format, and to add gas particles.

## Procedure

- To generate the dark matter ICs,

```bash
cd GalIC/code # or cd GalIC_2/code
./send.sh N
cd ../..
```

where N is the number of particles in one dimension (i.e. send 32 will produce $32^3$ dark matter particles).

- To convert the dark matter only ICs to the Arepo format, and to add gas

```bash
cd conversion/code
./send.sh final_name
cd ../..
```

where `final_name` is the name of the resulting HDF5 file that will get produced.

## Notes

- The final IC will have $N^3$ dark matter particles, and $ > N^3$ gas cells (the extra ones are for the background with a negligible density).

- After both runs the folders should've been cleaned of intermediate files, and final IC should be in the main repo directory (where this README.md file is).