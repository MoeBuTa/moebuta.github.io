---
title: "LLM for Robotics Review"
tags: PhD Robotics LLM RAG
categories: PhD
imgUrl: /assets/source/image/blog/
---

## Before LLM Emergence

- **Perception:**
   - **Scene Understanding:**
      - Utilizes algorithms for object detection, semantic segmentation, and scene reconstruction using 2D image data and LiDAR/RGB-D point clouds.
   - **State Estimation and SLAM:**
      - Integrates pose estimation and mapping, leveraging vision-based approaches, LiDAR, and IMU data.
   - **Learning-Based Methods:**
      - Employs supervised and self-supervised techniques to enhance pose-tracking and reconstruction capabilities.

- **Planning:**
   - **Search-Based Planning:**
      - Uses heuristics and graphs to compute robot trajectories, exemplified by pathfinding in discrete spaces.
   - **Sampling-Based Planning:**
      - Randomly samples points in configuration spaces to connect paths or generate states, suitable for high-dimensional and continuous spaces.
   - **Task Planning:**
      - Utilizes object-level abstractions and symbolic reasoning for planning in discrete domains.
   - **Reinforcement Learning:**
      - Applies end-to-end formulations for tasks like visual navigation and driving behaviors.


- **Control:**
   - **PID Control Loops:**
      - The fundamental method for maintaining desired operational states through feedback mechanisms.
   - **Model Predictive Control (MPC):**
      - Uses optimization-based methods for action sequence generation, particularly in dynamic environments.
   - **Imitation Learning:**
      - Learns control policies by mimicking expert demonstrations, applicable in contexts like urban driving and drone acrobatics.
   - **Reinforcement Learning:**
      - Optimizes control policies through accumulated rewards, focusing on direct action generation from sensory data without relying on dynamics models.

```mermaid
graph LR;
    A[Robotics]
    A --> B[Perception]
    A --> C[Planning]
    A --> D[Control]

    B --> B1[Scene Understanding]
    B1 --> B1a[Object Detection]
    B1 --> B1b[Semantic Segmentation]
    B1 --> B1c[Scene Reconstruction using 2D]
    B1 --> B1d[Scene Reconstruction using LiDAR/RGB-D]

    B --> B2[State Estimation and SLAM]
    B2 --> B2a[Pose Estimation]
    B2 --> B2b[Mapping with Vision-based Approaches]
    B2 --> B2c[Mapping with LiDAR]
    B2 --> B2d[Mapping with IMU]

    B --> B3[Learning-Based Methods]
    B3 --> B3a[Supervised Techniques for Pose-Tracking]
    B3 --> B3b[Supervised Techniques for Reconstruction]
    B3 --> B3c[Self-Supervised Techniques for Pose-Tracking]
    B3 --> B3d[Self-Supervised Techniques for Reconstruction]

    C --> C1[Search-Based Planning]
    C1 --> C1a[Heuristics for Pathfinding]
    C1 --> C1b[Graphs for Pathfinding in Discrete Spaces]

    C --> C2[Sampling-Based Planning]
    C2 --> C2a[Random Sampling in Configuration Spaces]
    C2 --> C2b[Path Connections]
    C2 --> C2c[Suitable for High-Dimensional Spaces]
    C2 --> C2d[Suitable for Continuous Spaces]

    C --> C3[Task Planning]
    C3 --> C3a[Object-Level Abstractions]
    C3 --> C3b[Symbolic Reasoning in Discrete Domains]

    C --> C4[Reinforcement Learning]
    C4 --> C4a[End-to-End Formulations for Visual Navigation]
    C4 --> C4b[End-to-End Formulations for Driving Behaviors]

    D --> D1[PID Control Loops]
    D1 --> D1a[Fundamental Method for Operational State Maintenance]

    D --> D2[Model Predictive Control (MPC)]
    D2 --> D2a[Optimization-Based Action Sequence Generation]
    D2 --> D2b[Application in Dynamic Environments]

    D --> D3[Imitation Learning]
    D3 --> D3a[Mimicking Expert Demonstrations]
    D3 --> D3b[Application in Urban Driving]
    D3 --> D3c[Application in Drone Acrobatics]

    D --> D4[Reinforcement Learning]
    D4 --> D4a[Optimizes Control Policies through Accumulated Rewards]
    D4 --> D4b[Direct Action Generation from Sensory Data]
    D4 --> D4c[No Reliance on Dynamics Models]

```



## LLM based 

## General-Purpose Robotics

Robots are designed to perform a wide range of tasks in various environments.

The tasks can be as simple as picking up an object and placing it in a different location

![img]({{ page.imgUrl }}armmobilerobot.png)

or as complex as conducting detailed inspections and maintenance tasks in an underground mine.

![img]({{ page.imgUrl }}undergroundminerobot.png)

The environments can be structured, like a factory floor, or unstructured, like a disaster site.

General-purpose robots are designed to perform a wide range of tasks in various environments without the need for reprogramming or reconfiguration.

## LLM advantages:

- **Pre-trained Foundation models**:
    - large-scale models that are trained on extensive and diverse datasets to acquire a broad knowledge base.
        - can generalize knowledge across a wide range of tasks and domains.
- **Interpretation of Natural Language Instructions**:
    - enable robots to understand and respond to human commands in natural language,
        - improving user interaction and accessibility.
- **Multi-Modal Sensory Data Interpretation**:
    - allow robots to interpret and respond to sensory data in natural language.
        - improve explainability on task planning and action generation.