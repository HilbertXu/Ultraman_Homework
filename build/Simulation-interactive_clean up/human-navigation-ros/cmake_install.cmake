# Install script for directory: /home/kamerider/catkin_ws/src/Simulation-interactive_clean up/human-navigation-ros

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
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/human_navigation/msg" TYPE FILE FILES
    "/home/kamerider/catkin_ws/src/Simulation-interactive_clean up/human-navigation-ros/msg/HumanNaviObjectInfo.msg"
    "/home/kamerider/catkin_ws/src/Simulation-interactive_clean up/human-navigation-ros/msg/HumanNaviTaskInfo.msg"
    "/home/kamerider/catkin_ws/src/Simulation-interactive_clean up/human-navigation-ros/msg/HumanNaviMsg.msg"
    "/home/kamerider/catkin_ws/src/Simulation-interactive_clean up/human-navigation-ros/msg/HumanNaviGuidanceMsg.msg"
    "/home/kamerider/catkin_ws/src/Simulation-interactive_clean up/human-navigation-ros/msg/HumanNaviAvatarPose.msg"
    )
endif()

if("${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/human_navigation/cmake" TYPE FILE FILES "/home/kamerider/catkin_ws/build/Simulation-interactive_clean up/human-navigation-ros/catkin_generated/installspace/human_navigation-msg-paths.cmake")
endif()

if("${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include" TYPE DIRECTORY FILES "/home/kamerider/catkin_ws/devel/include/human_navigation")
endif()

if("${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/roseus/ros" TYPE DIRECTORY FILES "/home/kamerider/catkin_ws/devel/share/roseus/ros/human_navigation")
endif()

if("${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/common-lisp/ros" TYPE DIRECTORY FILES "/home/kamerider/catkin_ws/devel/share/common-lisp/ros/human_navigation")
endif()

if("${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/gennodejs/ros" TYPE DIRECTORY FILES "/home/kamerider/catkin_ws/devel/share/gennodejs/ros/human_navigation")
endif()

if("${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  execute_process(COMMAND "/usr/bin/python" -m compileall "/home/kamerider/catkin_ws/devel/lib/python2.7/dist-packages/human_navigation")
endif()

if("${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/python2.7/dist-packages" TYPE DIRECTORY FILES "/home/kamerider/catkin_ws/devel/lib/python2.7/dist-packages/human_navigation")
endif()

if("${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/pkgconfig" TYPE FILE FILES "/home/kamerider/catkin_ws/build/Simulation-interactive_clean up/human-navigation-ros/catkin_generated/installspace/human_navigation.pc")
endif()

if("${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/human_navigation/cmake" TYPE FILE FILES "/home/kamerider/catkin_ws/build/Simulation-interactive_clean up/human-navigation-ros/catkin_generated/installspace/human_navigation-msg-extras.cmake")
endif()

if("${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/human_navigation/cmake" TYPE FILE FILES
    "/home/kamerider/catkin_ws/build/Simulation-interactive_clean up/human-navigation-ros/catkin_generated/installspace/human_navigationConfig.cmake"
    "/home/kamerider/catkin_ws/build/Simulation-interactive_clean up/human-navigation-ros/catkin_generated/installspace/human_navigationConfig-version.cmake"
    )
endif()

if("${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/human_navigation" TYPE FILE FILES "/home/kamerider/catkin_ws/src/Simulation-interactive_clean up/human-navigation-ros/package.xml")
endif()

