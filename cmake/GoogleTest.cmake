if(NOT TARGET GoogleTest_Setup)
    add_custom_target(GoogleTest_Setup)

    if (CMAKE_VERSION VERSION_LESS 3.2)
        set(UPDATE_DISCONNECTED_IF_AVAILABLE "")
    else()
        set(UPDATE_DISCONNECTED_IF_AVAILABLE "UPDATE_DISCONNECTED 1")
    endif()

    include(${CMAKE_CURRENT_LIST_DIR}/DownloadProject/DownloadProject.cmake)
    download_project(PROJ googletest
                     PREFIX "${CMAKE_CURRENT_LIST_DIR}"
                     URL https://github.com/google/googletest/archive/release-1.8.0.zip
                     URL_HASH SHA1=667f873ab7a4d246062565fad32fb6d8e203ee73
                     ${UPDATE_DISCONNECTED_IF_AVAILABLE}
    )

    # Prevent GoogleTest from overriding our compiler/linker options
    # when building with Visual Studio
    set(gtest_force_shared_crt ON CACHE BOOL "" FORCE)

    set(BUILD_GTEST ON CACHE BOOL "" FORCE)
    set(BUILD_GMOCK OFF CACHE BOOL "" FORCE)

    add_subdirectory(${googletest_SOURCE_DIR} ${googletest_BINARY_DIR})

    # When using CMake 2.8.11 or later, header path dependencies
    # are automatically added to the gtest and gmock targets.
    # For earlier CMake versions, we have to explicitly add the
    # required directories to the header search path ourselves.
    if (CMAKE_VERSION VERSION_LESS 2.8.11)
        include_directories("${gtest_SOURCE_DIR}/include")
    endif()
endif()
