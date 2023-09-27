---
title: "ROS2-1: Write Your First ROS2 Program"
tags: ROS Python CPP Linux
categories: Tech
header:
  teaser: /assets/source/image/teaser/robot.png
---

Learning Robot Operating System (ROS) for the preparation of applying for a PhD degree.

ROS2 benefits:
 - create the base layer fast
 - provide a standard for robotics applications
 - use on any robot
 - allows you to avoid reinventing the wheel
 - open source community
 - plug and play packages


Roadmap: 
 - Basics
   - topics 
     - publisher - subscriber
   - services
     - server - client
   - interfaces
     - custom msg
 - TF (TransForm)
   - Visualise Robot TFs in RViz 2
 - URDF (Unified Robot Description Format)
   - Visualise URDF in RViz 2
 - simulate robot with Gazebo
 - Navi2 stack
 - ros2 control
 - Moveit2


## Installation and configuration

**Step 1** check EOL to select the appropriate distribution. (Humble until 2027)


**Step 2** install ubuntu 22.04 (wsl), ros2, colcon, etc., by following the tutorial and documents in the reference.

**Step 3** run a ros demo

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

![architecture](/assets/source/image/blog/ros2-architecture.png)

<div style="text-align: center; font-style: italic;">
  ROS2 Architecture
</div>

### Python node

**Step 1** demo code in `ros2_ws/src/my_py_pkg/my_py_pkg/my_first_node.py`
```python
#!/usr/bin/env python3
import rclpy
from rclpy.node import Node

class MyNode(Node):
    def __init__(self):
        super().__init__("py_test")
        self.counter_ = 0
        self.get_logger().info("Hello ROS2")
        self.create_timer(0.5, self.timer_callback)

    def timer_callback(self):
        self.counter_ += 1
        self.get_logger().info("Hello "+str(self.counter_))

def main(args=None):
    rclpy.init(args=args)
    
    # create node inside the file, the name of the node is not the name of the file
    node = MyNode()
    
    # pause the program and make the node continue alive
    rclpy.spin(node)
    
    rclpy.shutdown()

if __name__=="__main__":
    main()
```

run the script `./my_first_node.py`

**Step 2** amend settings in `setup.py`
```python
entry_points={
    'console_scripts': [
        "py_node = my_py_pkg.my_first_node:main" # executable table
    ],
},
```

**Step 3** build package

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

### CPP node

**Step 1** manually config VScode library path: ctrl+shift+p -> edit C/C++: edit configuration JSON

```json
{
    "configurations": [
        {
            "name": "Linux",
            "includePath": [
                "${workspaceFolder}/**",
                "/opt/ros/humble/include/**"
            ],
            "defines": [],
            "compilerPath": "/usr/bin/clang-14",
            "cStandard": "c17",
            "cppStandard": "c++14",
            "intelliSenseMode": "linux-clang-x64"
        }
    ],
    "version": 4
}
```

**Step 2** demo code in `ros2_ws/src/my_cpp_pkg/my_cpp_pkg/my_first_node.cpp`
```cpp
#include "rclcpp/rclcpp.hpp"

class MyNode : public rclcpp::Node {
public:
  MyNode() : Node("cpp_test"), counter_(0) {
    RCLCPP_INFO(this->get_logger(), "Hello Cpp Node");
    timer_ = this->create_wall_timer(std::chrono::seconds(1),
                                     std::bind(&MyNode::timeCallback, this));
  }

private:
  void timeCallback() {
    counter_++;
    RCLCPP_INFO(this->get_logger(), "Hello %d", counter_);
  }

  rclcpp::TimerBase::SharedPtr timer_;
  int counter_;
};

int main(int argc, char **argv) {
  rclcpp::init(argc, argv);
  auto node = std::make_shared<MyNode>();
  rclcpp::spin(node);
  rclcpp::shutdown();
  return 0;
}
```

**Step 3** amend settings in CMakeLists.txt

```cmake
cmake_minimum_required(VERSION 3.8)
project(my_cpp_pkg)

if(CMAKE_COMPILER_IS_GNUCXX OR CMAKE_CXX_COMPILER_ID MATCHES "Clang")
  add_compile_options(-Wall -Wextra -Wpedantic)
endif()

# find dependencies
find_package(ament_cmake REQUIRED)
find_package(rclcpp REQUIRED)

# add executable table
add_executable(cpp_node src/my_first_node.cpp)
ament_target_dependencies(cpp_node rclcpp)

# install it inside the workspace
install(
  TARGETS cpp_node
  DESTINATION lib/${PROJECT_NAME}
)

# comment out tests
# if(BUILD_TESTING)
#   find_package(ament_lint_auto REQUIRED)
#   # the following line skips the linter which checks for copyrights
#   # comment the line when a copyright and license is added to all source files
#   set(ament_cmake_copyright_FOUND TRUE)
#   # the following line skips cpplint (only works in a git repo)
#   # comment the line when this package is in a git repo and when
#   # a copyright and license is added to all source files
#   set(ament_cmake_cpplint_FOUND TRUE)
#   ament_lint_auto_find_test_dependencies()
# endif()

ament_package()
```

**Step 4** build package

```bash
cd roc2_ws

colcon build --packages-select my_cpp_pkg
```

**Step 5** execute,
```bash
cd ros2_ws/install/my_cpp_pkg/lib/my_cpp_pkg

./cpp_node
```

alternatively,
```bash
source ~/.bashrc

ros2 run my_cpp_pkg
# then press tab twice to find out all packages

ros2 run my_cpp_pkg cpp_node
```

ROS2 - Language Libraries:

 - rcl: lowest ROS2 library, pure C library, basic functionalities, data distribution studies
   - rclcpp: cpp class library, write CPP code
   - rclpy: python class library, 
   - rclnodejs
   - rcljava
   - ...


 - ros
 - hand gesture
 - human-machine teaming
 - security



## References

[Introduction](http://wiki.ros.org/ROS/Introduction)

[ROS 2 Documentation: Humble](https://docs.ros.org/en/humble/index.html)

[Udemy Tutorial](https://www.udemy.com/course/ros2-for-beginners)

[Human-machine Teaming](https://research-repository.uwa.edu.au/en/publications/dynamic-two-way-communication-using-gestures-for-human-machine-te)


