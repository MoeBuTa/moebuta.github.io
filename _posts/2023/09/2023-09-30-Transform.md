---
title: "ROS2: Transform"
tags: ROS Python Linux
categories: Tech
---

A link in robotics typically refers to a physical component or part of a robot. These physical components can include things like robot arms, wheels, sensors, grippers, and other mechanical parts.

TF, short for "transform," is a library and system in ROS for managing and broadcasting the transformations between different coordinate frames within a robot or a robotic system.



## Visualise a Robot TFs in RViz 2

install the URDF tutorial
```bash
sudo apt update

sudo apt install ros-humble-urdf-tutorial

cd /opt/ros/humble/share/urdf_tutorial/urdf

ros2 launch urdf_tutorial display.launch.py model:=08-macroed.urdf.xacro
```

check topic list
```bash
ros2 topic list
# /joint_states
# /parameter_events
# /robot_description
# /rosout
# /tf
# /tf_static

ros2 topic echo /tf
```

install tools
```bash
sudo apt install ros-humble-tf2-tools

# create a pdf file
ros2 run tf2_tools view_frames
```