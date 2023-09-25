---
title: "ROS2-4: Services"
tags: ROS PhD Python CPP
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