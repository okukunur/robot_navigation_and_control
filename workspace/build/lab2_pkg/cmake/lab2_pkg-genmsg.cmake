# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "lab2_pkg: 1 messages, 0 services")

set(MSG_I_FLAGS "-Ilab2_pkg:/home/skysar/Documents/spring18/EE5531/lab2/jackal_jammers/workspace/src/lab2_pkg/msg;-Istd_msgs:/opt/ros/indigo/share/std_msgs/cmake/../msg;-Ilab2_pkg:/home/skysar/Documents/spring18/EE5531/lab2/jackal_jammers/workspace/src/lab2_pkg/msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(genlisp REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(lab2_pkg_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/home/skysar/Documents/spring18/EE5531/lab2/jackal_jammers/workspace/src/lab2_pkg/msg/rawTwist.msg" NAME_WE)
add_custom_target(_lab2_pkg_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "lab2_pkg" "/home/skysar/Documents/spring18/EE5531/lab2/jackal_jammers/workspace/src/lab2_pkg/msg/rawTwist.msg" "lab2_pkg/Vector3"
)

#
#  langs = gencpp;genlisp;genpy
#

### Section generating for lang: gencpp
### Generating Messages
_generate_msg_cpp(lab2_pkg
  "/home/skysar/Documents/spring18/EE5531/lab2/jackal_jammers/workspace/src/lab2_pkg/msg/rawTwist.msg"
  "${MSG_I_FLAGS}"
  "/home/skysar/Documents/spring18/EE5531/lab2/jackal_jammers/workspace/src/lab2_pkg/msg/Vector3.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/lab2_pkg
)

### Generating Services

### Generating Module File
_generate_module_cpp(lab2_pkg
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/lab2_pkg
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(lab2_pkg_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(lab2_pkg_generate_messages lab2_pkg_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/skysar/Documents/spring18/EE5531/lab2/jackal_jammers/workspace/src/lab2_pkg/msg/rawTwist.msg" NAME_WE)
add_dependencies(lab2_pkg_generate_messages_cpp _lab2_pkg_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(lab2_pkg_gencpp)
add_dependencies(lab2_pkg_gencpp lab2_pkg_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS lab2_pkg_generate_messages_cpp)

### Section generating for lang: genlisp
### Generating Messages
_generate_msg_lisp(lab2_pkg
  "/home/skysar/Documents/spring18/EE5531/lab2/jackal_jammers/workspace/src/lab2_pkg/msg/rawTwist.msg"
  "${MSG_I_FLAGS}"
  "/home/skysar/Documents/spring18/EE5531/lab2/jackal_jammers/workspace/src/lab2_pkg/msg/Vector3.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/lab2_pkg
)

### Generating Services

### Generating Module File
_generate_module_lisp(lab2_pkg
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/lab2_pkg
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(lab2_pkg_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(lab2_pkg_generate_messages lab2_pkg_generate_messages_lisp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/skysar/Documents/spring18/EE5531/lab2/jackal_jammers/workspace/src/lab2_pkg/msg/rawTwist.msg" NAME_WE)
add_dependencies(lab2_pkg_generate_messages_lisp _lab2_pkg_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(lab2_pkg_genlisp)
add_dependencies(lab2_pkg_genlisp lab2_pkg_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS lab2_pkg_generate_messages_lisp)

### Section generating for lang: genpy
### Generating Messages
_generate_msg_py(lab2_pkg
  "/home/skysar/Documents/spring18/EE5531/lab2/jackal_jammers/workspace/src/lab2_pkg/msg/rawTwist.msg"
  "${MSG_I_FLAGS}"
  "/home/skysar/Documents/spring18/EE5531/lab2/jackal_jammers/workspace/src/lab2_pkg/msg/Vector3.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/lab2_pkg
)

### Generating Services

### Generating Module File
_generate_module_py(lab2_pkg
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/lab2_pkg
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(lab2_pkg_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(lab2_pkg_generate_messages lab2_pkg_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/skysar/Documents/spring18/EE5531/lab2/jackal_jammers/workspace/src/lab2_pkg/msg/rawTwist.msg" NAME_WE)
add_dependencies(lab2_pkg_generate_messages_py _lab2_pkg_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(lab2_pkg_genpy)
add_dependencies(lab2_pkg_genpy lab2_pkg_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS lab2_pkg_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/lab2_pkg)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/lab2_pkg
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_cpp)
  add_dependencies(lab2_pkg_generate_messages_cpp std_msgs_generate_messages_cpp)
endif()
if(TARGET lab2_pkg_generate_messages_cpp)
  add_dependencies(lab2_pkg_generate_messages_cpp lab2_pkg_generate_messages_cpp)
endif()

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/lab2_pkg)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/lab2_pkg
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_lisp)
  add_dependencies(lab2_pkg_generate_messages_lisp std_msgs_generate_messages_lisp)
endif()
if(TARGET lab2_pkg_generate_messages_lisp)
  add_dependencies(lab2_pkg_generate_messages_lisp lab2_pkg_generate_messages_lisp)
endif()

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/lab2_pkg)
  install(CODE "execute_process(COMMAND \"/usr/bin/python\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/lab2_pkg\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/lab2_pkg
    DESTINATION ${genpy_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_py)
  add_dependencies(lab2_pkg_generate_messages_py std_msgs_generate_messages_py)
endif()
if(TARGET lab2_pkg_generate_messages_py)
  add_dependencies(lab2_pkg_generate_messages_py lab2_pkg_generate_messages_py)
endif()
