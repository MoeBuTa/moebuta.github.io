---
title: "Learning AI and Robotics"
tags: AI Robotics
categories: Literature
---

Creating my learning roadmap for AI and Robotics. 

## Roadmap

```mermaid

graph TD;

id1["Resnet"] --> id2["Transformer"];

id2-->d1([Robotic Foundations])


d1-->id3["Toward General-Purpose Robots via Foundation Model"];

d1-->id4["Foundation Models in Robotics"];

id3-->d2([Robotics+LLM])

id4-->d2

d2-->id5["AutoRT"];

d2-->|cybersecurity|id6["DriveLLM"]


```


## Paper list

_Deep Residual Learning for Image Recognition_ [[Paper]](/assets/source/materials/papers/resnet/Deep Residual Learning for Image Recognition.pdf)
 - resnet: visual recognition, imageNet detection
 - residual blocks, bottleneck architecture
![img](/assets/source/image/blog/resnet-arch.png)


_Attention Is All You Need_ [[Paper]](/assets/source/materials/papers/transformer/Attention Is All You Need.pdf)
 - transformer: translation, images, audio, video generation/processing
 - encoder, decoder, attention-based models

_Toward General-Purpose Robots via Foundation Models: A Survey and Meta-Analysis_ [[Paper]](/assets/source/materials/papers/robotics/survey/Toward General-Purpose Robots via Foundation Models A Survey and Meta-Analysis.pdf)

_Foundation Models in Robotics: Applications, Challenges, and the Future_ [[Paper]](/assets/source/materials/papers/robotics/survey/Foundation Models in Robotics.pdf)

_AutoRT: Embodied Foundation Models for Large Scale Orchestration of Robotic Agents_ [[Paper]](/assets/source/materials/papers/robotics/reasoning/AutoRT.pdf)
 - Autonomous robotics research: enable independent and broadly capable robotic agents

_DriveLLM: Charting the Path Toward Full Autonomous Driving With Large Language Models_ [[Paper]](/assets/source/materials/papers/robotics/llm/DriveLLM_Charting_the_Path_Toward_Full_Autonomous_Driving_With_Large_Language_Models.pdf)

