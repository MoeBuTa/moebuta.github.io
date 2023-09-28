---
title: "ROS2-7: Launch Files"
tags: ROS Python
categories: Tech
header:
  teaser: /assets/source/image/teaser/robot.png
---

start all your nodes and parameters from one single ROS2 Launch File.

## ROS2 - Launch Files

write a launch file script to automatically launch all nodes with parameters set.


```bash
cd ros2_ws/src/

# create a new package for launch file to
# reduce the number of dependencies between packages
ros2 pkg create my_robot_bringup

# remove folders and make a launch folder
cd my_robot_bringup
rm -rf include
rm -rf src
mkdir launch

# launch CMakeLists.txt package.xml
ls
```

In `CMakeLists.txt`
```cmake
cmake_minimum_required(VERSION 3.8)
project(my_robot_bringup)

if(CMAKE_COMPILER_IS_GNUCXX OR CMAKE_CXX_COMPILER_ID MATCHES "Clang")
  add_compile_options(-Wall -Wextra -Wpedantic)
endif()

# find dependencies
find_package(ament_cmake REQUIRED)

install(PARENT_DIRECTORY
  launch
  DESTINATION share/${[ROJECT_NAME}
)

ament_package()
```

```bash
cd launch
touch number_app.launch.py
chmod +x number_app.launch.py
```

In `number_app.launch.py`

```python
from launch import LaunchDescription
from launch_ros.actions import Node

# exact name for this function
def generate_launch_description():
    ld = LaunchDescription()
    
    number_publisher_node = Node(
        package="my_py_pkg",
        executable="number_publisher"
    )
    
    counter_node = Node(
        package="my_cpp_pkg",
        executable="number_counter"
    )
    
    ld.add_action(number_publisher_node)
    ld.add_action(number_counter_node)
    return ld
```

in `package.xml`

```xml
<?xml version="1.0"?>
<?xml-model href="http://download.ros.org/schema/package_format3.xsd" schematypens="http://www.w3.org/2001/XMLSchema"?>
<package format="3">
  <name>my_robot_bringup</name>
  <version>0.0.0</version>
  <description>TODO: Package description</description>
  <maintainer email="moebuta@todo.todo">moebuta</maintainer>
  <license>TODO: License declaration</license>

  <buildtool_depend>ament_cmake</buildtool_depend>
  
<!--    add execute dependencies-->
  <exec_depend>my_py_pkg</exec_depend>
  <exec_depend>my_cpp_pkg</exec_depend>

  <test_depend>ament_lint_auto</test_depend>
  <test_depend>ament_lint_common</test_depend>

  <export>
    <build_type>ament_cmake</build_type>
  </export>
</package>

```

Run the launch file
```bash
ros2 launch my_robot_bringup number_app.launch.py
```

## Configure Nodes in a Launch File


In `number_app.launch.py`
```python
from launch import LaunchDescription
from launch_ros.actions import Node


# exact name for this function
def generate_launch_description():
    ld = LaunchDescription()
    
    # set remap rule here
    remap_number_topic = ("number", "my_number")
    
    # can add any logics
    number_publisher_node = Node(
        package="my_py_pkg",
        executable="number_publisher", # node
        name="my_number_publisher", # rename node
        remappings=[remap_number_topic], # rename topics
        parameters=[ # set parameter values
            {"number_to_publish": 4},
            {"publish_frequency": 5.0}
        ]
    )

    number_counter_node = Node(
        package="my_cpp_pkg",
        executable="number_counter",
        name="my_number_counter",
        remappings=[remap_number_topic, ("number_count", "my_number_count")]
    )

    ld.add_action(number_publisher_node)
    ld.add_action(number_counter_node)
    return ld
```
