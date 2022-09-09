cmake_minimum_required(VERSION 3.19)

project(ICE_CIRCULAR)

include(CoreWidgetLib/Qt.cmake)

add_subdirectory(CoreWidgetLib)
add_subdirectory(ICE_gauge)
add_subdirectory(ComplexGuage)
#add_subdirectory(SportsMinimalistGauge)
#add_subdirectory(SportEnergyGauge)
#add_subdirectory(ChevyGaugeTris)

add_executable(DevApp)

target_link_libraries(
    DevApp
    PRIVATE
    ICE_gauge
    ComplexGuage
    Qt5::Widgets
    )

target_sources(
    DevApp
    PRIVATE
    src/DevAppMain.cpp
    )                   
