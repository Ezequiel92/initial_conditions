<div align="center">
    <h1>💱 Hydrodynamical IC conversions</h1>
</div>

# AREPO

Arepo code configured to transform ICs in the binary format of GADGET (`SnapFormat` = 2) to HDF5 ICs for Arepo.

## Usage

Make the script runable
```bash
chmod 700 ./AREPO/runme.sh
```

Run it with the path to the file to be converted as an input

```bash
./runme.sh ./AREPO/source_ic/YOUR_BINARY_ICs
```

Only one IC file at a time can be converted. If the run is successful, there should be a `output` folder with the HDF5 ICs in the `AREPO` directory.

# GADGET

[Pluto](https://github.com/fonsp/Pluto.jl) notebook for converting between initial conditions (IC) formats.

It goes from a human readable `.dat` file (from the [AGORA](https://sites.google.com/site/santacruzcomparisonproject/data) project) to the binary format of GADGET (`SnapFormat` = 2) or the HDF5 format for GADGET (`SnapFormat` = 3).

# HDF5 information

[HDF5 Julia library](https://juliaio.github.io/HDF5.jl/stable/)

[HDF5 in GADGET4](https://wwwmpa.mpa-garching.mpg.de/gadget4/06_snapshotformat/#hdf5-file-format)

[HDF5 in AREPO](https://arepo-code.org/wp-content/userguide/snapshotformat.html#format-3-hdf5)
