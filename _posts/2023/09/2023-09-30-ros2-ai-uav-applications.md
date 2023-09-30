---
title: "ROS2 UAV AI Applications"
tags: ROS AI
categories: Literature
---

summarising UAV-related knowledge and AI-based UAV applications to get ideas for research topics.

## UAV background

- **classification**:
    - fixed-wing, single rotor, fixed-wing hybrid, multirotor

- **characteristics**:
    - speed and flight time, payload, sensing equipment, software, range and altitude, controllers

- **applications**:
    - search and rescue
    - infrastructure and construction inspection
    - emergency medical services
    - real-time monitoring of road traffic
    - precision agriculture
    - ...

- **challenges**:

    - Efficient target detection

    - unstable networks for swarm of drones

    - resource allocation/energy optimisation

    - limited transmission range

    - standardisation and operational regulations

    - security of sensitive data (pos, loc...)

    - ...

- **AI research directions**:
    - deep-learning-based novel strategies for UAVs, particularly for SAR mission

![ai-uav](/assets/source/image/blog/ai-uav.png)

![ai-uav-2](/assets/source/image/blog/ai-uav-2.png)

## AI features

- **Detection** - machine learning:
    - deep learning algorithms for target detection

- **Navigation** - automatic planning:
    - optimal path planning in flight control system
    - autonomous obstacle avoidance

- **Communication** - distributed AI:
    - coordinate intelligent behaviors among a group of autonomous mobile agents
    - multi-UAV cooperative formation (UAV swarm)


## Detection

### Overview

### 1. Image detection

**Automated Wheat Disease Detection using a ROS-based Autonomous Guided UAV**

- image-based deep learning approach
    - **object detection model**: YOLO V4, EfficientDet, MobileNet V3, VGG 16, Inception, ResNet 50, and
      EfficientNet-B0.
    - **CNN**: weight-sharing ability

- **a custom dataset has been created and labeled**
    - **data augmentation techniques**: increase the number of training data

- efficient mapping and navigation system is presented using a Gazebo simulation
    - **SLAM** (simultaneous localization and mapping):
        - **map**: contains the static obstacles of the robot’s workspace
        - **localization**: enables the robot to map its environment while simultaneously estimating its own position
          regarding this map.
        - **using sensors** (camera, laser range-finder, ultrasonic sensor) to evaluate its distance to the nearby
          obstacles.
        - implemented and tested in a **simulation environment**

- A 2D simultaneous localization and mapping algorithm is used for mapping the workspace autonomously.

- **Summary**: ml for image classification, slam for exploration, A* algorithm for determining move trajectory.



## Navigation

### Overview

### Visual Odometry

**Real-time ROS Implementation of Conventional Feature-based and Deep-learning-based Monocular Visual Odometry for UAV**

- localization is one of the most important tasks for UAVs
    - conventional feature-based methods:**ORB-SLAM3**
        - detection of key features in each image and match them on consecutive images to estimate the camera motions

    - Deep-learning: **SC-SfMLearner** (self-supervised learning)
        - achieve high results on public dataset, but lack of real-time implementation in ROS for navigation system.

- photo-realistic simulator, **Flightmare**, is used to test the implementation
    - fast in collecting and computing a large number of images,
    - but also integrate an accurate UAV dynamic

- Visual Odometry (VO) benchmark dataset:  KITTI, EuRoC, and CityScapes

- **evaluation** process is done by integrating the aforementioned pose estimators into a real-time navigation system,
  benchmarking on streams of photo-realistic synthesized RGB data acquired from Flightmare.
    - the outperforming of the **features-based ORB-SLAM3 over learning-based counterpart**, SC-SfMLearner
    - **learning-based algorithms are vulnerable to failure cases** in which the drone trajectory contains excessive yaw
      rotations.



## Communication



## 

## References

[Unmanned aerial vehicles (UAVs): practical aspects, applications, open challenges, security issues, and future trends](https://link.springer.com/article/10.1007/s11370-022-00452-4)

[The Application of Artificial Intelligence Technology in UAV](https://ieeexplore.ieee.org/stamp/stamp.jsp?tp=&arnumber=9363809)

[Machine Learning Applications in Internet-of-Drones: Systematic Review, Recent Deployments, and Open Issues](https://dl.acm.org/doi/full/10.1145/3571728)

[A review of AI-enabled routing protocols for UAV networks: Trends, challenges, and future outlook](https://www.sciencedirect.com/science/article/pii/S1570870522000087)

[Automated Wheat Disease Detection using a ROS-based Autonomous Guided UAV](https://arxiv.org/abs/2206.15042)

[Real-time ROS Implementation of Conventional Feature-based and Deep-learning-based Monocular Visual Odometry for UAV](https://ieeexplore.ieee.org/document/9990287)