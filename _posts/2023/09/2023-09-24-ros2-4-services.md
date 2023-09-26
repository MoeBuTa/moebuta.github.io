---
title: "ROS2-4: Services"
tags: ROS Python
categories: Tech
header:
  teaser: /assets/source/image/teaser/robot.png
---

Services are used for a client/server interaction.

## ROS2 - Services

 - A ROS2 Service is a client/server system
   - synchronous or asynchronous
   - one message type for request, another type for response
   - can be written in Python, C++, ... directly inside ROS nodes
   - a service server can only exist once, but can have many clients.


## Python Service Server

```python
#!/usr/bin/env python3
import rclpy
from rclpy.node import Node

from example_interfaces.srv import AddTwoInts


class AddTwoIntsServerNode(Node):
    def __init__(self):
        super().__init__("add_two_ints_server")

        # naming: verb + indications on what you are doing
        self.server_ = self.create_service(
            AddTwoInts, "add_two_ints", self.callback_add_two_ints)

        self.get_logger().info("Add two ints server has been started!")

    def callback_add_two_ints(self, request, response):

        # bash: ros2 interface show example_interfaces/srv/AddTwoInts
        response.sum = request.a + request.b
        self.get_logger().info(str(request.a) + " + " +
                               str(request.b) + " = " + str(response.sum))
        return response


# directly use client side bash:
# ros2 service call /add_two_ints example_interfaces/srv/AddTwoInts "{a: 3, b: 4}


def main(args=None):
    rclpy.init(args=args)
    node = AddTwoIntsServerNode()
    rclpy.spin(node)
    rclpy.shutdown()


if __name__ == "__main__":
    main()
```

## Python Service Client
```python
#!/usr/bin/env python3
import rclpy
from rclpy.node import Node
from functools import partial

from example_interfaces.srv import AddTwoInts


class AddTwoIntsClientNode(Node):
    def __init__(self):
        super().__init__("add_two_ints_client")
        self.call_add_two_ints_server(6, 7)

    def call_add_two_ints_server(self, a, b):
        client = self.create_client(AddTwoInts, "add_two_ints")
        while not client.wait_for_service(1.0):
            self.get_logger().warn("Waiting for Server Add Two Ints...")
        request = AddTwoInts.Request()
        request.a = a
        request.b = b

        future = client.call_async(request=request)
        future.add_done_callback(
            partial(self.callback_call_add_two_ints, a=a, b=b))

    def callback_call_add_two_ints(self, future, a, b):
        try:
            response = future.result()
            self.get_logger().info(str(a) + " + " +
                                   str(b) + " = " + str(response.sum))
        except Exception as e:
            self.get_logger().error("Service call failed %r" % (e,))


def main(args=None):
    rclpy.init(args=args)
    node = AddTwoIntsClientNode()
    rclpy.spin(node=node)
    rclpy.shutdown()


if __name__ == "__main__":
    main()

```