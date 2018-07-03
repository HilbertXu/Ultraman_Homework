# Install script for directory: /home/kamerider/catkin_ws/src/Simulation-interactive_clean up/sigverse_ros_package/sigverse_ros_bridge

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "/home/kamerider/catkin_ws/install")
endif()
string(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
if(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  if(BUILD_TYPE)
    string(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  else()
    set(CMAKE_INSTALL_CONFIG_NAME "")
  endif()
  message(STATUS "Install configuration: \"${CMAKE_INSTALL_CONFIG_NAME}\"")
endif()

# Set the component getting installed.
if(NOT CMAKE_INSTALL_COMPONENT)
  if(COMPONENT)
    message(STATUS "Install component: \"${COMPONENT}\"")
    set(CMAKE_INSTALL_COMPONENT "${COMPONENT}")
  else()
    set(CMAKE_INSTALL_COMPONENT)
  endif()
endif()

# Install shared libraries without execute permission?
if(NOT DEFINED CMAKE_INSTALL_SO_NO_EXE)
  set(CMAKE_INSTALL_SO_NO_EXE "1")
endif()

if("${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/pkgconfig" TYPE FILE FILES "/home/kamerider/catkin_ws/build/Simulation-interactive_clean up/sigverse_ros_package/sigverse_ros_bridge/catkin_generated/installspace/sigverse_ros_bridge.pc")
endif()

if("${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/sigverse_ros_bridge/cmake" TYPE FILE FILES
    "/home/kamerider/catkin_ws/build/Simulation-interactive_clean up/sigverse_ros_package/sigverse_ros_bridge/catkin_generated/installspace/sigverse_ros_bridgeConfig.cmake"
    "/home/kamerider/catkin_ws/build/Simulation-interactive_clean up/sigverse_ros_package/sigverse_ros_bridge/catkin_generated/installspace/sigverse_ros_bridgeConfig-version.cmake"
    )
endif()

if("${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/sigverse_ros_bridge" TYPE FILE FILES "/home/kamerider/catkin_ws/src/Simulation-interactive_clean up/sigverse_ros_package/sigverse_ros_bridge/package.xml")
endif()

