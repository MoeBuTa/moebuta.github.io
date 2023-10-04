---
title: "ROS2: Nav2 Stack"
tags: ROS Python Linux
categories: Tech
header:
  teaser: /assets/source/image/teaser/robot.png
---

## Installation

install navigation 2 stack:
```bash
sudo apt install ros-humble-navigation2 ros-humble-nav2-bringup ros-humble-turtlebot3*
```

install tools:

```bash
# colcon
sudo apt install python3-colcon-common-extensions

# git
sudo apt install git

# terminator (optional) ctrl+shift+o, ctrl+shift+e
sudo apt install terminator

#vs code (optional)
sudo snap install code --classic
```


## Understand the Nav2 Stack


### Global Planner

Nav2 supports various path planning algorithms, such as Dijkstra's algorithm, A* algorithm, and others, which help the robot find collision-free paths in the environment.

Global Planner will use the entire map to compute the path, it will try to reach the destination as fast as possible with the best possible path. (Use Global Costmap to compute it)

### Local Planner / Controller

The controller component is responsible for executing the planned path and controlling the robot's motion.

Global path will be sent to the controller, which will try to follow this path (high update rate).


### Parameters

rqt -> Plugins -> Configuration -> Dynamic Reconfigure

global_costmap
 - publish_frequency
 - update_frequency
 - inflation_radius
 - robot_radius
 - ...

### recovery behaviour

Nav2 provides recovery behaviors that the robot can use to handle unexpected situations or failures in navigation.







