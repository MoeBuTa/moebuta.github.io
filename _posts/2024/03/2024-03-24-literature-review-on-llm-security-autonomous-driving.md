---
title: "Literature Review on LLM, Security, Autonomous Driving"
tags: LLM Robotics Security
categories: Literature
imgUrl: "/assets/source/image/blog/"
---

## Frameworks

![img]({{ page.imgUrl }}llm-av-framework1.png) 
[[Paper]](https://arxiv.org/pdf/2309.10228.pdf)

![img]({{ page.imgUrl }}drivellm%20reasoning.png) 
[[Paper]](https://ieeexplore.ieee.org/stamp/stamp.jsp?tp=&arnumber=10297415)

![img]({{ page.imgUrl }}drivelm-arch.png)
[[Paper]](https://arxiv.org/abs/2312.14150)

## Multi-modality




## Security

![img]({{ page.imgUrl }}llm-vlm-attack.png) 
[[Paper]](https://arxiv.org/pdf/2402.10340.pdf)


## Evaluation

Real-time Performance:
 - decision-making time
   - Token-per-minute (TPM)
   - Decision-per-second (DPS)

Spatial-Temporal Reasoning in Dynamic Environments:
 - existing LLMs process inputs independently without temporal aspects
   - less effective when interacting with multiple dynamic objects (conservative)
   - Mitigation:
     - Responsibility-Sensitive Safety (RSS) model 
       - convert temporal object information (position, velocity...) into textual data
 
Proactive Decision-making:
 - model can anticipate potential challenges and react accordingly
   - integrating observations with commonsense reasoning

