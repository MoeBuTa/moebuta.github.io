---
title: "Research Proposal Plan"
tags: ROS
categories: Literature
---


- Over the past decade, autonomous unmanned aerial vehicles (UAVs) have found applications across various aspects, including search and rescue, security, surveillance, infrastructure inspection, agricultural monitoring, etc.
- Dynamic path planning is crucial for autonomous systems, especially UAV, as it ensures mission success, cost-efficiency, and safety. However, existing algorithms often suffer from high computation times, inadequate collision avoidance, and suboptimal resource allocation. Researchers are working on intelligent, computationally efficient planning methods to address these challenges and enable high-quality path planning and re-planning. Key obstacles include efficient path planning, collision avoidance considering UAV constraints, and ensuring safety in dynamic environments with both static and dynamic obstacles. Overcoming these challenges is vital for autonomous UAVs to operate effectively in real-world scenarios, advancing autonomous systems.





### aims of the research


The main objective of the research is to propose an autonomous path-planning and collision-avoidance solution for the UAV, providing a viable route and allowing the UAV to reach the inspection points avoiding static and dynamic obstacles present in the space. This work aims to advance a methodology for real-time adaptive path planning based on the fusion of multiple AI approaches applied to UAVs. This work will  address the online path-planning problem and collision avoidance of the UAV in the navigation process. The framework will be assessed by simulations performed in the robot operating system (ROS) along with the Gazebo platform.



Research questions:
1. How can we effectively utilise different data source for UAV navigation in dynamic environment?
    - data source for navigation
      - Vision-based: cameras
      - LiDAR-based: Laser range finder
      - Signal-based: GPS modules, remote radio head (RRH)
      - Inertia-based: gyroscopes, accelerometers, altimeters

2. How can AI-based path planning solutions be effectively adapted to dynamic changes in the environment?
   - Safety: avoid collisions
   - Adaptability: adapt to dynamic environments
   - Computational Efficiency: optimise computational costs

### significance of the research

dynamic and uncertain environments
 - human and UAV collaborate
 - real-time navigation
 - e.g. search and rescue operation



## Background

### Classifications of UAV Navigation

 ~~- indoor~~
 ~~- outdoor~~
 ~~- wireless~~
 ~~- search and rescue~~

  - inertia-based: gyroscopes, accelerometers, and altimeters to guide the onboard flight controller
  - vision-based: cameras
  - signal-based: GPS modules and a remote radio head (RRH) in the case of cellular connectivity

### Classifications of AI approaches

UAV Navigation Techniques

 - ROS2 toolkit: nav2 for robot navigation
   - limitation in 3d path planning

 - AI approaches
   - Optimisation-based
     - Traditional:
       - Dijkstra and A*, DE and GA, SA, PSO, ACO, APF...
     - Sampling:
       - RRT, PRM (DEP, HIRE)
   - Learning-based
     - RL, DRL (MDP)

## methodology

 - Sampling for 3D exploration path-planning
   - Rapidly Exploring Random Tree (RRT)
   - heuristic-based incremental probabilistic roadmap exploration (HIRE)
   - computational efficiency and diverse information gain formulation

 - Dynamically adapt previous trajectory
   - Deep Reinforcement Learning (DRL) with Markov decision process (MDP)

 - Experiments in software in the loop simulation and physical environments
   - ROS2 Humble
   - gazebo simulator
   - 

 - terminating condition:
   - search for a specific target(s)
   - explore all unknown regions
   - ...

 - metrics
   - exploration time, 
   - path length, 
   - computational time
   - ...


## reference

A. A. Maw, M. Tyan, T. A. Nguyen, and J. W. Lee, "iADA*-RL: Anytime graph-based path planning with deep reinforcement learning for an autonomous UAV," Applied Sciences, vol. 11, no. 9, p. 3948, 2021.

Z. Xu, D. Deng, and K. Shimada, "Autonomous UAV exploration of dynamic environments via incremental sampling and probabilistic roadmap," IEEE Robotics and Automation Letters, vol. 6, no. 2, pp. 2729-2736, 2021.

Z. Xu, C. Suzuki, X. Zhan, and K. Shimada, "Heuristic-based Incremental Probabilistic Roadmap for Efficient UAV Exploration in Dynamic Environments," arXiv preprint arXiv:2309.09121, 2023.

G. G. D. Castro, G. S. Berger, A. Cantieri, M. Teixeira, J. Lima, A. I. Pereira, and M. F. Pinto, "Adaptive Path Planning for Fusing Rapidly Exploring Random Trees and Deep Reinforcement Learning in an Agriculture Dynamic Environment UAVs," Agriculture, vol. 13, no. 2, p. 354, 2023.


S. Rezwan and W. Choi, "Artificial intelligence approaches for UAV navigation: Recent advances and future challenges," IEEE Access, vol. 10, pp. 26320-26339, 2022.

M. De Rose, "LiDAR-based Dynamic Path Planning of a mobile robot adopting a costmap layer approach in ROS2," Ph.D. dissertation, Politecnico di Torino, 2021.