---
title: "ROS2-4: Services"
tags: ROS Python
categories: Tech
header:
  teaser: /assets/source/image/teaser/robot.png
---

Services facilitate client/server communication, supporting both synchronous and asynchronous modes (though asynchronous usage is preferred, even when waiting within the same thread). They offer anonymity, where clients are unaware of the specific server node, simply invoking the service. Similarly, servers remain unaware of client nodes, solely handling incoming requests and providing responses.


When you want to add a new communication between your nodes, ask yourself this question: “Am I just sending some data, or do I expect a response after I send the message?”. This will tell you if you need to use a Topic or a Service. And, as you progress with ROS2, it will eventually become quite obvious to you.

## ROS2 - Services

 - A ROS2 Service is a client/server system
   - one message type for request, another type for response
   - can be written in Python, C++, ... directly inside ROS nodes
   - a service server can only exist once, but can have many clients.


 - To implement Services inside your nodes:
   - Create a node or start from an existing one. Add as many Service servers as you want (all with different names)
   - When you call a Service server from a Service client, make sure that the Service name, as well as the Service type (request + response) are identical. 
   - You can only create one server for a Service, but you can create many clients.

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
        '''
        call a request to the server
        '''

        # create a client that is waiting for a server
        client = self.create_client(AddTwoInts, "add_two_ints")

        # check the service server per second until it ready
        while not client.wait_for_service(1.0):
            self.get_logger().warn("Waiting for Server Add Two Ints...")

        # construct a request
        request = AddTwoInts.Request()
        request.a = a
        request.b = b

        # send request to the server and asynchorously get the response result
        future = client.call_async(request=request)

        # Add a callback to be executed when the receive the response from the server.
        # use partial to pass multiple arguments (a, b) to the callback function.
        future.add_done_callback(
            partial(self.callback_call_add_two_ints, a=a, b=b))

    def callback_call_add_two_ints(self, future, a, b):
        '''
        a callback action triggered when receive the response from the server
        '''
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


## 