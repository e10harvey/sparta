# TODO: Do we need set(CMAKE_STATIC_LINKER_FLAGS "rs")?
# Seems like kitware doesn't want anyone using ar flags other than "qc"

if(PKG_MPI_STUBS)
    ########## BEGIN TARGET_SPARTA_BUILD_MPI_TPL_STUBS ##########
    set(CMAKE_CXX_COMPILER "g++")
    set(CMAKE_CXX_FLAGS "-O -fPIC")
    set(CMAKE_AR "ar")
    
    message(VERBOSE "${CMAKE_CURRENT_SOURCE_DIR}: CMAKE_CXX_COMPILER=${CMAKE_CXX_COMPILER}")

    set_source_files_properties(mpi.c PROPERTIES LANGUAGE CXX)
    file(GLOB SPARTA_PKG_STUBS_SRC_FILES
        LIST_DIRECTORIES false
        CONFIGURE_DEPENDS
        *.c *.h
    )
    set(SPA_SRC_FILES "${SPA_SRC_FILES};${SPARTA_PKG_STUBS_SRC_FILES}" PARENT_SCOPE)
    set(TARGET_SPARTA_PKGS "${TARGET_SPARTA_PKGS};${CMAKE_CURRENT_SOURCE_DIR}" PARENT_SCOPE)
    #add_library(${TARGET_SPARTA_BUILD_MPI_TPL} STATIC mpi.c)
    #set_target_properties(${TARGET_SPARTA_BUILD_MPI_TPL} PROPERTIES LINKER_LANGUAGE CXX)
    #target_compile_options(${TARGET_SPARTA_BUILD_MPI_TPL} PUBLIC ${SPARTA_CXX_COMPILE_FLAGS} ${SPARTA_DEFAULT_CXX_COMPILE_FLAGS})

    # Make include public so that targets which link against this can find the includes
    #target_include_directories(${TARGET_SPARTA_BUILD_MPI_TPL} PUBLIC ${CMAKE_CURRENT_SOURCE_DIR})
    ########## END   TARGET_SPARTA_BUILD_MPI_TPL_STUBS ##########
endif()
