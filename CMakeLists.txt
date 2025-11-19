cmake_minimum_required(VERSION 3.16)
project(cmake-exercise)

set(CMAKE_CXX_STANDARD 17)

# Find dependencies
find_package(Boost REQUIRED COMPONENTS filesystem)
find_package(deal.II 9.0 REQUIRED)
find_package(yaml-cpp REQUIRED)

add_executable(main 
    main.cpp
    flatset/flatset.cpp
    filesystem/filesystem.cpp
    fem/fem.cpp
    yamlParser/yamlParser.cpp
)

target_include_directories(main PRIVATE ${CMAKE_CURRENT_SOURCE_DIR})
target_link_libraries(main Boost::filesystem yaml-cpp)

# deal.II specific macros
DEAL_II_SETUP_TARGET(main)
