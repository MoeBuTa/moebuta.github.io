---
title: "ROS2 AI Application"
tags: ROS AI
categories: Literature
---


 - _Automated Wheat Disease Detection using a ROS-based Autonomous Guided UAV._

   - image-based deep learning approach
     - **object detection model**: YOLO V4, EfficientDet, MobileNet V3, VGG 16, Inception, ResNet 50, and EfficientNet-B0.
     - **CNN**: weight-sharing ability

   - **a custom dataset has been created and labeled**
     - **data augmentation techniques**: increase the number of training data

   - efficient mapping and navigation system is presented using a Gazebo simulation
     - **SLAM** (simultaneous localization and mapping): 
       - **map**: contains the static obstacles of the robot’s workspace
       - **localization**: enables the robot to map its environment while simultaneously estimating its own position regarding this map.
       - **using sensors** (camera, laser range-finder, ultrasonic sensor) to evaluate its distance to the nearby obstacles.
       - implemented and tested in a **simulation environment**

   - A 2D simultaneous localization and mapping algorithm is used for mapping the workspace autonomously.

   - **Summary**: ml for image classification, slam for exploration, A* algorithm for determining move trajectory.


 - _Real-time ROS Implementation of Conventional Feature-based and Deep-learning-based Monocular Visual Odometry for UAV._

   - localization is one of the most important tasks for UAVs
     - conventional feature-based methods:**ORB-SLAM3**
       - detection of key features in each image and match them on consecutive images to estimate the camera motions

     - Deep-learning: **SC-SfMLearner** (self-supervised learning)
       - achieve high results on public dataset, but lack of real-time implementation in ROS for navigation system.

   - photo-realistic simulator, **Flightmare**, is used to test the implementation
     - fast in collecting and computing a large number of images, 
     - but also integrate an accurate UAV dynamic

   - Visual Odometry (VO) benchmark dataset:  KITTI, EuRoC, and CityScapes

   - **evaluation** process is done by integrating the aforementioned pose estimators into a real-time navigation system, benchmarking on streams of photo-realistic synthesized RGB data acquired from Flightmare. 
     - the outperforming of the **features-based ORB-SLAM3 over learning-based counterpart**, SC-SfMLearner
     - **learning-based algorithms are vulnerable to failure cases** in which the drone trajectory contains excessive yaw rotations.

