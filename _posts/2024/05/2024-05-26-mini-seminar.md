---
title: "Mini Seminar"
tags: PhD Robotics LLM RAG
categories: PhD
imgUrl: /assets/source/image/blog/
---

#  Leveraging Large Language Models for General-Purpose Robot Control


## Introduction

**Key Points:**
- **Significance of AI in Robotics:**
    - AI and machine learning advancements drive the rise of general-purpose robots.
    - Enables robots to perform diverse tasks with increased efficiency and adaptability.

**Examples of AI-Powered Robots:**
1. **Autonomous Vehicles**:
    - **Example**: Tesla's self-driving cars
    - **Application**: Navigate roads, avoid obstacles, and respond to traffic signals autonomously.
    - **Reference**: [Tesla Autopilot](https://www.tesla.com/autopilot)
      ![img]({{ page.imgUrl }}teslabot.png)
2. **Service Robots in Hospitality**:
    - **Example**: SoftBank Robotics' Pepper
    - **Application**: Used in hotels and restaurants to greet guests, provide information, take orders, and even entertain.
    - **Reference**: [Pepper Robot](https://emea.softbankrobotics.com/)
      ![img]({{ page.imgUrl }}softbankrobot.png)
3. **Security Robots**:
    - **Example**: Knightscope K5
    - **Application**: Patrol areas such as parking lots, corporate campuses, and malls to detect anomalies, provide surveillance, and deter crime.
    - **Reference**: [Knightscope K5](https://www.knightscope.com/)
      ![img]({{ page.imgUrl }}securityrobot.png)

## Motivation

**Challenges with AI in Robotics for Traditional Approaches:**
- The models are typically trained on specific datasets to perform specific tasks.
  - Having difficulty in generalizing across diverse tasks.
  - Unpredictability of real-world environments because of the edge conditions.

**Proposed Research Topics**
 - **Leveraging Large Language Models (LLMs)**:
   - **Pre-trained Foundation models**: 
     - large-scale models that are trained on extensive and diverse datasets to acquire a broad knowledge base.
     - Knowledge-rich and capable of reasoning across diverse tasks.
   - **Interpretation of Natural Language Instructions**: 
     - Enhances human-robot interaction.
   - **Multi-Modal Sensory Data Interpretation**: 
     - Improves task planning and action generation.

**Research Questions**
 - How can LLMs be effectively integrated into general-purpose robotic systems to improve the 
 interpretation of natural language instructions and multi-modal sensory data for enhanced task planning and action 
   generation?
 - What are the optimal strategies that allows LLMs to access and utilize domain-specific knowledge in real-time to mitigate risks of inaccurate or false information and improve the performance and adaptability of general-purpose robots?


## Background

```mermaid

graph LR;
    A[Robotics]
    A --> B[Perception]
    A --> C[Planning]
    A --> D[Control]
```

### Perception

![img]({{ page.imgUrl }}perception.png)

### Planning
![img]({{ page.imgUrl }}planning.png)

### Control
![img]({{ page.imgUrl }}control.png)

## Related Works

### Before LLM Emergence


```mermaid
graph LR;

    B[Perception] --> B1[Scene Understanding]
    B1 --> B1a[Object Detection]
    B1 --> B1b[Semantic Segmentation]
    B1 --> B1c[Scene Reconstruction]


    B --> B2[State Estimation and SLAM]
    B2 --> B2a[Pose Estimation]
    B2 --> B2b[Mapping with Sensors]

    B --> B3[Learning-Based Methods]
    B3 --> B3a[Supervised Techniques]
    B3 --> B3c[Self-Supervised Techniques]

    C[Planning] --> C1[Search-Based Planning]
    C1 --> C1a[Heuristics for Pathfinding]
    C1 --> C1b[Graphs for Pathfinding in Discrete Spaces]

    C --> C2[Sampling-Based Planning]
    C2 --> C2a[Random Sampling in Configuration Spaces]
    C2 --> C2b[Path Connections]

    C --> C3[Task Planning]
    C3 --> C3a[Object-Level Abstractions]
    C3 --> C3b[Symbolic Reasoning in Discrete Domains]

    C --> C4[Reinforcement Learning]
    C4 --> C4a[End-to-End Formulations]

    D[Control] --> D1[PID Control Loops]
    D1 --> D1a[Fundamental Method for Operational State Maintenance]

    D --> D2["Model Predictive Control (MPC)"]
    D2 --> D2a[Optimization-Based Action Sequence Generation]
    D2 --> D2b[Application in Dynamic Environments]
    
    D --> D3[Imitation Learning]
    D3 --> D3a[Mimicking Expert Demonstrations]
    D3 --> D3b[Application in Urban Driving]
    
    D --> D4[Reinforcement Learning]
    D4 --> D4a[Optimizes Control Policies through Accumulated Rewards]
    D4 --> D4b[Direct Action Generation from Sensory Data]

```


### LLM-powered Robotics

 - Perception
   - receive sensory data and interpret it in natural language.
 - Planning
   - generate task plans based on natural language instructions and sensory data of the robot
 - Control
   - generate actions based on the task plans and sensory data.
   - explain the actions taken in natural language.


## Current Work

LLM for Robotics Navigations using Eyesim simulator


![img]({{ page.imgUrl }}eyesimllm.png)


<video width="640" height="360" controls>
  <source src="{{page.imgUrl}}eyesimllm.mp4" type="video/mp4">
  Your browser does not support the video tag.
</video>


