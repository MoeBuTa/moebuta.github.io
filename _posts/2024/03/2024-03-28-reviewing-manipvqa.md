---
title: "Reviewing ManipVQA"
tags: LLM Robotics
categories: Tech
imgUrl: "/assets/source/image/blog/"
---


_ManipVQA: Injecting Robotic Affordance and Physically Grounded Information into Multi-Modal Large Language Models_ [
[Paper]](https://arxiv.org/abs/2403.11289)

![img]({{ page.imgUrl }}manipvqa-arch.png)


## Problem statement:
- Conventional MLLMs trained on basic image-text pairs lack robotics knowledge.
- They miss key concepts like affordances and physical understanding.
- This limits their effectiveness in manipulation tasks.

## ManipVQA:
- a fresh framework aiming to equip MLLMs with knowledge essential for manipulation tasks.
- Using a Visual Question-Answering format, it goes beyond basic image-text pairs.
- This approach includes identifying tools, recognizing affordances, and understanding physical concepts comprehensively.

## Methods:
- Gathering diverse images of interactive objects
    - challenges MLLMs in tool detection, affordance recognition, and physical understanding.
- Adopting a unified VQA format
    - seamlessly integrates robotic-specific knowledge with MLLMs' vision-reasoning abilities.
- Fine-tuning MLLMs
    - maintains their original skills while incorporating new insights.
- Tests in robotic simulators and vision benchmarks
    - validate the approach's effectiveness.

## Dataset

 - Robotic Affordance Dataset
 - Physically Grounded Dataset
   - PhysObjects
 - General Visual Reasoning Datasets
   - PACO, refCoco, Visual Genome
 - Augmented Instructions with GPT-4
   - ![img]({{ page.imgUrl }}augmented-instruction-gpt4.png)
