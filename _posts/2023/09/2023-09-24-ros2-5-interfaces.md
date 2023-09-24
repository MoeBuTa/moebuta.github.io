---
title: "ROS2-5: Interfaces"
tags: ROS PhD Python C++
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
