# kokkos_mpi_only = KOKKOS package with Serial backend (no OpenMP support), MPI compiler, default MPI

include(${CMAKE_SOURCE_DIR}/cmake/presets/kokkos_common.cmake)
#################### BEGIN SPARTA OPTIONS ####################
set(SPARTA_CMAKE_CONFIG_STRING
    kokkos_mpi_only
    CACHE
    STRING "Descriptive string to describe \"spa_\" executable configuration"
    FORCE
    )
#################### END   SPARTA OPTIONS ####################

#################### BEGIN KOKKOS OPTIONS ####################
set(Kokkos_ENABLE_OpenMP OFF CACHE STRING "")
#################### END   KOKKOS OPTIONS ####################
