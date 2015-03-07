cmake_minimum_required(VERSION 3.0)

project(calculator)

# Only support Debug and Release configurations
set(CMAKE_CONFIGURATION_TYPES "Debug;Release" CACHE STRING "" FORCE)

# Require separate build directory
if(CMAKE_SOURCE_DIR STREQUAL CMAKE_BINARY_DIR)
    message(FATAL_ERROR "Compiling in the source directory is not supported")
endif()

# Setup output directories
set(CMAKE_ARCHIVE_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/bin)
set(CMAKE_LIBRARY_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/bin)
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/bin)

# Default to Debug
if(CMAKE_BUILD_TYPE)
    set(CONFIG ${CMAKE_BUILD_TYPE})
else()
    set(CONFIG Debug)
    set(CMAKE_BUILD_TYPE Debug)
endif()

add_subdirectory(api)
add_subdirectory(client)
add_subdirectory(server)
