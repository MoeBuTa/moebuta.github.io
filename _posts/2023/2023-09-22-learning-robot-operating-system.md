---
title: "Learning Robot Operating System"
tags: ROS PhD
categories: Tech
header:
  teaser: /assets/source/image/teaser/robot.png
---

Learning Robot Operating System (ROS) for the preparation of applying for a PhD degree.

## Installation and configuration

**Step 1** check EOL to select the appropriate distribution. (Humble until 2027)


**Step 2** install ubuntu 22.04 (wsl), ros2, colcon, etc., by following the tutorial and documents in the reference.

**Step 3** Run a ros demo

```bash
ros2 run demo_nodes_cpp talker

ros2 run demo_nodes_cpp listener
```

**Step 4** create and set up a workspace

```bash
mkdir ros2_ws

cd ros2_ws/

mkdir src

colcon build

source ~/ros2_ws/install/setup.bash
```

**Step 5** create ros2 package: separate your code into reusable blocks.

```bash
cd ~/ros_ws/src

# create package for python
ros2 pkg create my_py_pkg --build-type ament_python --dependencies rclpy

# fix the bug occurred when setuptools==59.6.0
pip3 install setuptools==58.2.0 

# create package for cpp
ros2 pkg create my_cpp_pkg --build-type ament_cmake --dependencies rclcpp

# build all packages
colcon build

# build a single package
colcon build --packages-select my_py_pkg
```
 - `my_py_pkg`: package name

 - `--build-type ament_python`: specify build type, ament (build system), python (language)

 - `dependecies rclpy`: library used

##  ROS2 Nodes

 - subprograms in your application, responsible for only one thing
 - combined into a graph
 - communicate with each other through topics, services, and parameters
 - benefits
   - reduce code complexity
   - fault tolerance - loosely coupled
   - can be written in Python, C++,...
 - All nodes' names are unique.

**Step 1** create a python file `ros2_ws/src/my_py_pkg/my_py_pkg/my_first_node.py`
```python
#!/usr/bin/env python3
import rclpy
from rclpy.node import Node

def main(args=None):
    rclpy.init(args=args)
    
    # create node inside the file, the name of the node is not the name of the file
    node = Node("py_test")
    
    # print something
    node.get_logger().info("Hello ROS2")
    
    # pause the program and make the node continue alive
    rclpy.spin(node)
    
    rclpy.shutdown()

if __name__=="__main__":
    main()
```

run the script `./my_first_node.py`

**Step 2** edit the execute table in the `setup.py`
```python
entry_points={
    'console_scripts': [
        "py_node = my_py_pkg.my_first_node:main" # execute table
    ],
},
```

**Step 3** Build package

```bash
cd roc2_ws

colcon build --packages-select my_py_pkg
```
 **Step 4** execute package (the path for built packages can be found in `setup.cfg`)


```bash
cd /install/my_py_pkg/lib/my_py_pkg

ls # found py_node

source ~/.bashrc

./py_node # the second way to run the node
```

However, these approaches are not used in reality. We will use `ros2 run` when we actually run a project

```bash
source .bashrc

ros2 run my_py_pkg py_node
```


 - ros
 - hand gesture
 - human-machine teaming
 - security



## References

[Introduction](http://wiki.ros.org/ROS/Introduction)

[ROS 2 Documentation: Humble](https://docs.ros.org/en/humble/Releases.html)

[Udemy Tutorial](https://www.udemy.com/course/ros2-for-beginners)

[Human-machine Teaming](https://research-repository.uwa.edu.au/en/publications/dynamic-two-way-communication-using-gestures-for-human-machine-te)

[Webots](https://docs.ros.org/en/iron/Tutorials/Advanced/Simulators/Webots/Installation-Windows.html)
