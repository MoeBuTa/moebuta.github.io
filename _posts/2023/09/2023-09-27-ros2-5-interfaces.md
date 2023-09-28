---
title: "ROS2-5: Interfaces"
tags: ROS Python Linux
categories: Tech
header:
  teaser: /assets/source/image/teaser/robot.png
---

ROS2 interfaces are the messages and services you use with your topics and services.

## ROS2 - Msg and Srv

 - use msg primitive types to create a message definition
 - create a message definition using other message definitions

**Topic**:
 - Name: `/number_count`
 - Msg definition: `example_interfaces/msg/int64`

**Service**:
 - Name: `/reset_number_count`
 - Srv definition: `example_interfaces/srv/SetBool`


## Create and Build Your First Custom Msg

```bash
cd /ros2_ws/src
ros2 pkg create my_robot_interfaces 
cd my_robot_interfaces/
rm -rf include/
rm -rf src/
mkdir msg

```
In package.xml
```xml
  <!-- functionalities to build interfaces -->
  <build_depend>rosidl_default_generators</build_depend>
  <exec_depend>rosidl_default_runtime</exec_depend>
  <member_of_group>rosidl_interface_packages</member_of_group>
```

In CMakeLists.txt
```cmake
# find dependencies
find_package(ament_cmake REQUIRED)
find_package(rosidl_default_generators REQUIRED)

rosidl_generate_interfaces(${PROJECT_NAME}
  "msg/HardwareStatus.msg"
)

ament_export_dependencies(rosidl_default_runtime)
ament_package()
```

Then start build a first msg
```bash
cd msg/

# use uppercase for new word, no msg inside the name
touch HardwareStatus.msg
```

In HardwareStatus.msg
```txt
int64 temperature
bool are_motors_ready
string debug_message
```

Then build the package
```bash
cd /ros2_ws
colcon build --packages-select my_robot_interfaces
```

test
```bash
source ~/.bashrc
ros2 interface show my_robot_interfaces/msg/HardwareStatus
```

## Use Your Custom Msg in a Python Node

### add installed custom msg to the dependencies
in package.xml
```xml
  <depend>rclpy</depend>
  <depend>example_interfaces</depend>
  <depend>my_robot_interfaces</depend>
```

add **python autocomplete path** in settings.json in VScode and restart it
```json
"python.autoComplete.extraPaths": [
    "~/ros2_ws/install/my_robot_interfaces/local/lib/python3.10/dist-packages/my_robot_interfaces/"
]
```

### create a publisher that use this custom msg

Create new python file in my_py_pkg:
```bash
touch hw_status_publisher.py
chmod +x hw_status_publisher.py
```




```python
#!/usr/bin/env python3
import rclpy
from rclpy.node import Node

from my_robot_interfaces.msg import HardwareStatus


class HardwareStatusPublisherNode(Node):
    def __init__(self):
        super().__init__("hardware_status_publisher")
        self.hw_status_publisher_ = self.create_publisher(
            msg_type=HardwareStatus, topic="hardware_status", qos_profile=10)
        self.get_logger().info("Hardware status publisher has been started!")

    def publish_hw_status(self):
        msg = HardwareStatus()
        msg.temperature = 45
        msg.are_motors_ready = True
        msg.debug_message = "Nothing special here"
        self.hw_status_publisher_.publish(msg)


def main(args=None):
    rclpy.init(args=args)
    node = HardwareStatusPublisherNode(Node)
    rclpy.spin(node)
    rclpy.shutdown()


if __name__ == "__main__":
    main()

```


In `setup.py`
```python
entry_points={
    'console_scripts': [
        "py_node = my_py_pkg.my_first_node:main",  # executable
        "robot_news_station = my_py_pkg.robot_news_station:main",
        "smartphone = my_py_pkg.smartphone:main",
        "add_two_ints_server = my_py_pkg.add_two_ints_server:main",
        "add_two_ints_client = my_py_pkg.add_two_ints_client:main",
        "hw_status_publisher = my_py_pkg.hw_status_publisher:main"
    ],
},
```

build package, run the node, test the result
```bash
# terminal 1
cd /ros2_ws
colcon build --packages-select my_py_pkg --symlink-install
ros2 run my_py_pkg hw_status_publisher

# terminal 2
source ~/.bashrc
ros2 node list
ros2 topic list
ros2 topic echo /hardware_status
```


useful commands for debug:
```bash
ros interface package list
ros2 interface package sensor_msgs

# find node name
ros2 node list 

# find interface name
ros2 node info /hardware_status_publisher

# find msg
ros2 interface show my_robot_interfaces/msg/HardwareStatus


ros2 topic list
ros2 topic info /hardware_status
ros2 interface show my_robot_interfaces/msg/HardwareStatus


ros2 service list
ros2 service type /add_two_ints
ros2 interface show example_interfaces/srv/AddTwoInts
```