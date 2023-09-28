---
title: "ROS2-6: Parameters"
tags: ROS Python
categories: Tech
header:
  teaser: /assets/source/image/teaser/robot.png
---

Parameters will allow you to provide run-time settings for your nodes. No need to compile again.

## ROS2 - Parameters

 - provide settings for your nodes, value set at run time
 - a parameter is specific to a node
 - ros2 parameter types:
   - boolean, int, double, string, lists, ...


## Declare Parameters

```bash
ros2 param

# find node: parameter
ros2 param list

# find node
ros2 node list

# find what parameters currently running
ros2 param get /number_publisher use_sim_time
```

```python
#!/usr/bin/env python3
import rclpy
from rclpy.node import Node
 
 
class NumberPublisherNode(Node):
    def __init__(self):
        super().__init__("number_publisher") 
        
        # declare a parameter
        self.declare_parameter("test123")
        
        self.number = 2
        self.number_publisher_ = self.create_publisher(Int64, "number", 10)
        self.number_timer_ = self.create_timer(1.0, self.publish_number)
        self.get_logger().info("Number publisher has been started.")
    
    def publish_number(self):
        msg = Int64()
        msg.data = self.number_
        self.number_publisher_.publish(msg)
 
def main(args=None):
    rclpy.init(args=args)
    node = NumberPublisherNode() 
    rclpy.spin(node)
    rclpy.shutdown()
 
 
if __name__ == "__main__":
    main()

```

then
```bash
colcon build --package-select my_py_pkg --symlink-install

# have "/number_publisher: test123" printed
ros2 param list

# print parameter not set.
ros2 param get /number_publisher test123

# run node
# -p: set parameter value
ros2 run my_py_pkg number_publisher --ros-args -p test123:=3

# terminal2
# Integer value is: 3
ros2 param get /number_publisher test123
```

## Add Another Parameter

```python
self.declare_parameter("another_param")
```

```bash
ros2 run my_py_pkg number_publisher --ros-args -p another_param:="hi"

# terminal2
# String value is: hi
ros2 param get /number_publisher test123 
```

## Use Parameter

```python
#!/usr/bin/env python3
import rclpy
from rclpy.node import Node
 
 
class NumberPublisherNode(Node):
    def __init__(self):
        super().__init__("number_publisher") 
        
        # set default value
        self.declare_parameter("number_to_publish", 2)
        self.declare_parameter("publish_frequency", 1.0)
        
        # pass the parameter value to the variable
        self.number_ = self.get_parameter("number_to_publish").value
        self.publish_frequency_ =  self.get_paramter("publish_frequency").value
        
        self.number_publisher_ = self.create_publisher(Int64, "number", 10)
        self.number_timer_ = self.create_timer(1.0, self.publish_frequency_, self.publish_number)
        self.get_logger().info("Number publisher has been started.")
    
    def publish_number(self):
        msg = Int64()
        msg.data = self.number_
        self.number_publisher_.publish(msg)
 
def main(args=None):
    rclpy.init(args=args)
    node = NumberPublisherNode() 
    rclpy.spin(node)
    rclpy.shutdown()
 
 
if __name__ == "__main__":
    main()
```

Change value at runtime
```bash
ros2 run my_py_pkg number_publisher --ros-args -p number_to_publish:=3 -p publish_frequency:=3
```