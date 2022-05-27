#!/bin/bash

####################################################################################################
#                                       Compile-time options                                       #
####################################################################################################

#-------------------------------------- Basic operation mode
ADDBACKGROUNDGRID=32                     # Re-grid hydrodynamics quantities on a Oct-tree AMR grid.

#-------------------------------------- Computational box
# The default is a cubic box with periodic boundary conditions.

#-------------------------------------- Hydrodynamics
# The default is GAMMA = 5/3 ideal hydrodynamics.

#-------------------------------------- Magnetohydrodynamics
# By default, code only computes hydrodynamics. 

#-------------------------------------- Riemann solver
# By default, an iterative, exact (hydrodynamics) Riemann solver is used. 

#-------------------------------------- Mesh motion
REGULARIZE_MESH_CM_DRIFT                # Mesh regularization. Move mesh generating point towards center of mass to make cells rounder.
REGULARIZE_MESH_CM_DRIFT_USE_SOUNDSPEED # Limits mesh regularization speed by local sound speed.

#-------------------------------------- Refinement
REFINEMENT_SPLIT_CELLS                  # Allows refinement.
REFINEMENT_MERGE_CELLS                  # Allows derefinement.
REFINEMENT_VOLUME_LIMIT                 # Limits the volume of cells and the maximum volume difference between neighboring cells.
NODEREFINE_BACKGROUND_GRID              # The background grid will be prevented from derefining.
OPTIMIZE_MESH_MEMORY_FOR_REFINEMENT     # Deletes the mesh structures not needed for refinement/derefinemet to lower the peak memory consumption.

#-------------------------------------- Non-standard physics
COOLING                                 # Simple primordial cooling.
USE_SFR                                 # Allows star formation. See Springel et al. (2003, MNRAS, 339, 289).

#-------------------------------------- Gravity
SELFGRAVITY                             # Computes gravitational interactions between simulation particles and cells.
HIERARCHICAL_GRAVITY                    # Use hierarchical splitting of the time integration of the gravity.
CELL_CENTER_GRAVITY                     # Uses geometric centers to calculate gravity of cells.
GRAVITY_NOT_PERIODIC                    # Gravity is not treated periodically.
ALLOW_DIRECT_SUMMATION                  # Uses direct summation if the number of active particles is < DIRECT_SUMMATION_THRESHOLD.
DIRECT_SUMMATION_THRESHOLD=500          # Overrides maximum number of active particles for which direct summation is performed.

#-------------------------------------- TreePM
# By default, no Particle-Mesh calculation is done.

#-------------------------------------- Gravity softening
NSOFTTYPES=2                            # Number of different softening values to which particle types can be mapped.
MULTIPLE_NODE_SOFTENING                 # If a softened tree node is to be used, this is done with the softening of its different mass components.
INDIVIDUAL_GRAVITY_SOFTENING=32         # Bitmask with particle types where the softenig type should be chosen based on mass.
ADAPTIVE_HYDRO_SOFTENING                # Adaptive softening of gas cells depending on their size.

#-------------------------------------- External gravity
# By default, there is no external gravitational potential.

#-------------------------------------- Navarro-Frenk-White potential
# By default, no potential is imposed on the dark matter.

#-------------------------------------- Isothermal Sphere potential
# By default, no potential is imposed on the dark matter.

#-------------------------------------- Hernquist potential
# By default, no potential is imposed on the dark matter.

#-------------------------------------- Time integration
TREE_BASED_TIMESTEPS                    # Non-local timestep criterion (take 'signal speed' into account).

#-------------------------------------- Message Passing Interface
IMPOSE_PINNING                          # Enforce pinning of MPI tasks to cores if MPI does not do it.

#-------------------------------------- Single/Double Precision
DOUBLEPRECISION=1                       # Full double precision.
DOUBLEPRECISION_FFTW                    # FFTW calculation in double precision.
NGB_TREE_DOUBLEPRECISION                # If this is enabled, double precision is aslo used for storing the spatial neighbor node extension

#-------------------------------------- Groupfinder
# By default, the fiends-of-friends group finder is turned off.

#-------------------------------------- Subfind
# By default, the Subfind subtructure finder is turned off.

#-------------------------------------- Special behavior
RUNNING_SAFETY_FILE                     # if file './running' exists, do not start the run.
USE_DIRECT_IO_FOR_RESTARTS              # Try to use O_DIRECT for low-level read/write operations of restart files.

#-------------------------------------- Input options
# Options for reading and transforming IC files.

#-------------------------------------- Special input options
# Options for reading and transforming IC files.

#-------------------------------------- Output fields
OUTPUT_VERTEX_VELOCITY                  # Output the velocity of the mesh-generating points.
OUTPUT_CENTER_OF_MASS                   # Output the center of mass of the cells.
OUTPUT_PRESSURE                         # Output the pressure of the gas.
OUTPUTTIMESTEP                          # Output the timestep of the particles.
OUTPUT_SOFTENINGS                       # Output the particle softenings.
OUTPUTCOOLRATE                          # Output the cooling rate.
OUTPUT_COOLHEAT                         # Output the actual energy loss/gain in cooling/heating routine.
OUTPUT_VORTICITY                        # Output the vorticity of the gas.

#-------------------------------------- Output options
PROCESS_TIMES_OF_OUTPUTLIST             # Goes through the output list to ensure that outputs are written as close to the desired time as possible
REDUCE_FLUSH                            # Files and stdout are only flushed after a certain time defined in the parameter file.
HAVE_HDF5                               # The code will be compiled with support for input and output in the HDF5 format.
HDF5_FILTERS                            # Activate snapshot compression and checksum for HDF5 output.

#-------------------------------------- Testing and Debugging
# Testing and debugging options.

#-------------------------------------- Re-gridding
# These options are auxiliary modes to prepare/convert/relax ICs.