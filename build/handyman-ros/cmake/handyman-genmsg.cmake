# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "handyman: 1 messages, 0 services")

set(MSG_I_FLAGS "-Ihandyman:/home/kamerider/catkin_ws/src/handyman-ros/msg;-Istd_msgs:/opt/ros/kinetic/share/std_msgs/cmake/../msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(geneus REQUIRED)
find_package(genlisp REQUIRED)
find_package(gennodejs REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(handyman_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/home/kamerider/catkin_ws/src/handyman-ros/msg/HandymanMsg.msg" NAME_WE)
add_custom_target(_handyman_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "handyman" "/home/kamerider/catkin_ws/src/handyman-ros/msg/HandymanMsg.msg" ""
)

#
#  langs = gencpp;geneus;genlisp;gennodejs;genpy
#

### Section generating for lang: gencpp
### Generating Messages
_generate_msg_cpp(handyman
  "/home/kamerider/catkin_ws/src/handyman-ros/msg/HandymanMsg.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/handyman
)

### Generating Services

### Generating Module File
_generate_module_cpp(handyman
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/handyman
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(handyman_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(handyman_generate_messages handyman_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/kamerider/catkin_ws/src/handyman-ros/msg/HandymanMsg.msg" NAME_WE)
add_dependencies(handyman_generate_messages_cpp _handyman_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(handyman_gencpp)
add_dependencies(handyman_gencpp handyman_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS handyman_generate_messages_cpp)

### Section generating for lang: geneus
### Generating Messages
_generate_msg_eus(handyman
  "/home/kamerider/catkin_ws/src/handyman-ros/msg/HandymanMsg.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/handyman
)

### Generating Services

### Generating Module File
_generate_module_eus(handyman
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/handyman
  "${ALL_GEN_OUTPUT_FILES_eus}"
)

add_custom_target(handyman_generate_messages_eus
  DEPENDS ${ALL_GEN_OUTPUT_FILES_eus}
)
add_dependencies(handyman_generate_messages handyman_generate_messages_eus)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/kamerider/catkin_ws/src/handyman-ros/msg/HandymanMsg.msg" NAME_WE)
add_dependencies(handyman_generate_messages_eus _handyman_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(handyman_geneus)
add_dependencies(handyman_geneus handyman_generate_messages_eus)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS handyman_generate_messages_eus)

### Section generating for lang: genlisp
### Generating Messages
_generate_msg_lisp(handyman
  "/home/kamerider/catkin_ws/src/handyman-ros/msg/HandymanMsg.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/handyman
)

### Generating Services

### Generating Module File
_generate_module_lisp(handyman
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/handyman
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(handyman_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(handyman_generate_messages handyman_generate_messages_lisp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/kamerider/catkin_ws/src/handyman-ros/msg/HandymanMsg.msg" NAME_WE)
add_dependencies(handyman_generate_messages_lisp _handyman_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(handyman_genlisp)
add_dependencies(handyman_genlisp handyman_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS handyman_generate_messages_lisp)

### Section generating for lang: gennodejs
### Generating Messages
_generate_msg_nodejs(handyman
  "/home/kamerider/catkin_ws/src/handyman-ros/msg/HandymanMsg.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/handyman
)

### Generating Services

### Generating Module File
_generate_module_nodejs(handyman
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/handyman
  "${ALL_GEN_OUTPUT_FILES_nodejs}"
)

add_custom_target(handyman_generate_messages_nodejs
  DEPENDS ${ALL_GEN_OUTPUT_FILES_nodejs}
)
add_dependencies(handyman_generate_messages handyman_generate_messages_nodejs)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/kamerider/catkin_ws/src/handyman-ros/msg/HandymanMsg.msg" NAME_WE)
add_dependencies(handyman_generate_messages_nodejs _handyman_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(handyman_gennodejs)
add_dependencies(handyman_gennodejs handyman_generate_messages_nodejs)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS handyman_generate_messages_nodejs)

### Section generating for lang: genpy
### Generating Messages
_generate_msg_py(handyman
  "/home/kamerider/catkin_ws/src/handyman-ros/msg/HandymanMsg.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/handyman
)

### Generating Services

### Generating Module File
_generate_module_py(handyman
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/handyman
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(handyman_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(handyman_generate_messages handyman_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/kamerider/catkin_ws/src/handyman-ros/msg/HandymanMsg.msg" NAME_WE)
add_dependencies(handyman_generate_messages_py _handyman_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(handyman_genpy)
add_dependencies(handyman_genpy handyman_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS handyman_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/handyman)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/handyman
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_cpp)
  add_dependencies(handyman_generate_messages_cpp std_msgs_generate_messages_cpp)
endif()

if(geneus_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/handyman)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/handyman
    DESTINATION ${geneus_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_eus)
  add_dependencies(handyman_generate_messages_eus std_msgs_generate_messages_eus)
endif()

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/handyman)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/handyman
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_lisp)
  add_dependencies(handyman_generate_messages_lisp std_msgs_generate_messages_lisp)
endif()

if(gennodejs_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/handyman)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/handyman
    DESTINATION ${gennodejs_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_nodejs)
  add_dependencies(handyman_generate_messages_nodejs std_msgs_generate_messages_nodejs)
endif()

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/handyman)
  install(CODE "execute_process(COMMAND \"/usr/bin/python\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/handyman\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/handyman
    DESTINATION ${genpy_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_py)
  add_dependencies(handyman_generate_messages_py std_msgs_generate_messages_py)
endif()
