<div align="center">
    <h1>💱 Initial conditions for hydrodynamical simulations</h1>
</div>

# Arepo

- ICs: Initial conditions for Arepo in `ICFormat = 3` (HDF5). The number in the filename indicates the number of dark matter particles in one dimension, e.g. `isolated_32.hdf5` has $32^3$ dark matter particles and $ > 32^3$ gas cells (the extra ones are the background cells, with negligible density).
- ic_gen: Code to generate and transform ICs.

## HDF5 information

[HDF5 Julia library](https://juliaio.github.io/HDF5.jl/stable/)

[HDF5 in GADGET4](https://wwwmpa.mpa-garching.mpg.de/gadget4/06_snapshotformat/#hdf5-file-format)

[HDF5 in AREPO](https://arepo-code.org/wp-content/userguide/snapshotformat.html#format-3-hdf5)

# Gadget

- ICs: Initial conditions for P-Gadget3 in `ICFormat = 1` (binary files). The number in the filename indicates the number of particles in one dimension, e.g. `gassphere_32.dat` has $\sim 32^3 / 2$ dark matter particles and $\sim 32^3 / 2$ gas particles.
- AGORA_project: [Pluto](https://github.com/fonsp/Pluto.jl) notebook for converting between initial conditions (IC) formats. It goes from a human readable `.dat` file (from the [AGORA](https://sites.google.com/site/santacruzcomparisonproject/data) project) to the binary format (`SnapFormat` = 2) or the HDF5 format (`SnapFormat` = 3), both for Gadget.
