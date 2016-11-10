cmake_minimum_required(VERSION 2.8.2)

project(GoogleTestCmakeTest)

include(${CMAKE_CURRENT_SOURCE_DIR}/cmake/GoogleTest.cmake)

add_executable(GoogleTestCmakeTest GoogleTestCmakeTest.cpp)
target_link_libraries(GoogleTestCmakeTest PRIVATE gtest gtest_main)

enable_testing()
add_test(GoogleTestCmakeTest GoogleTestCmakeTest)
