#!/bin/bash

##################################################
#  Enable/Disable compile-time options as needed #
##################################################

#--------------------------------------- Basic operation mode of code
ADDBACKGROUNDGRID=16                     # re-grid hydrodynamics quantities on a Oct-tree AMR grid. This does not perform a simulation.

#--------------------------------------- Gravity treatment; default: no gravity
GRAVITY_NOT_PERIODIC          # gravity is not treated periodically

#--------------------------------------- Mesh motion and regularization
REGULARIZE_MESH_FACE_ANGLE               # use maximum face angle as roundness criterion in mesh regularization

#--------------------------------------- Gravity softening
NSOFTTYPES=2                             # number of different softening values to which particle types can be mapped.

#--------------------------------------- Output options
HAVE_HDF5                                # needed when HDF5 I/O support is desired (recommended)
