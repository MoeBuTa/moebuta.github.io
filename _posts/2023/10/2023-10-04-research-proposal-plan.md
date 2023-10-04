---
title: "Research Proposal Plan"
tags: ROS
categories: Literature
---

Effective Artificial Intelligence Approaches for Autonomous UAV Navigation and Obstacle Avoidance in Dynamic Environments

## Background to the topic


Different applications for autonomous exploration technique:
 - Search and Rescue, 
 - Security and Surveillance, 
 - Infrastructure Inspection,
 - Agricultural Monitoring, 
 - ...


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




## aims of the research

Exploring effective AI-based path planning solutions for autonomous robot navigation and obstacle avoidance in dynamic environments.

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


## significance of the research

In dynamic and unknown environments where humans work alongside UAVs, the need for a real-time, informative path-planning solution is becoming imperative. It is vital for effectively navigating unknown areas while ensuring the safety of human workers. Hence, it is essential to create an exploration path planning solution that is both efficient and safe to address the challenges presented by dynamic environments.


## methodology

 - Sampling for 3D exploration path-planning
   - Rapidly Exploring Random Tree (RRT)
   - heuristic-based incremental probabilistic roadmap exploration (HIRE)
   - computational efficiency and diverse information gain formulation

 - Dynamically adapt previous trajectory
   - Deep Reinforcement Learning (DRL) with Markov decision process (MDP)

 - Experiments in simulation and physical environments
   - ROS2 Humble
   - gazebo simulator

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

Z. Xu, D. Deng, and K. Shimada, "Autonomous UAV exploration of dynamic environments via incremental sampling and probabilistic roadmap," IEEE Robotics and Automation Letters, vol. 6, no. 2, pp. 2729-2736, 2021.

Z. Xu, C. Suzuki, X. Zhan, and K. Shimada, "Heuristic-based Incremental Probabilistic Roadmap for Efficient UAV Exploration in Dynamic Environments," arXiv preprint arXiv:2309.09121, 2023.

G. G. D. Castro, G. S. Berger, A. Cantieri, M. Teixeira, J. Lima, A. I. Pereira, and M. F. Pinto, "Adaptive Path Planning for Fusing Rapidly Exploring Random Trees and Deep Reinforcement Learning in an Agriculture Dynamic Environment UAVs," Agriculture, vol. 13, no. 2, p. 354, 2023.


S. Rezwan and W. Choi, "Artificial intelligence approaches for UAV navigation: Recent advances and future challenges," IEEE Access, vol. 10, pp. 26320-26339, 2022.

M. De Rose, "LiDAR-based Dynamic Path Planning of a mobile robot adopting a costmap layer approach in ROS2," Ph.D. dissertation, Politecnico di Torino, 2021.