---
title: "Robotic System Roadmap"
tags: AI Robotics
categories: Literature
---

Summarising from _Toward General-Purpose Robots via Foundation Models: A Survey and Meta-Analysis_ [[Paper]](/assets/source/materials/papers/robotics/survey/Toward General-Purpose Robots via Foundation Models A Survey and Meta-Analysis.pdf)


## Robotic System Classification in General

```mermaid

graph LR;
Start["Robotic System"]-->n1["Robot Perception"];
n1-->n1.1("Passive Perception");

n1-->n1.2("State Estimation");

n1-->n1.3("Active Perception");


Start-->n2["Robot Decision-making and Planning"];
n2-->n2.1("Classical Planning");

n2-->n2.2("Learning-based Planning");


Start-->n3["Robot Action Generation"];
n3-->n3.1("Classical Control");
n3-->n3.2("Learning-based Control");




```

## Visual Foundation Models (VFMs)
```mermaid
graph LR;
    VFMs-->n1["downstream passive perception tasks"]
    n1-->self-supervision
    n1-->n2["large-scale data curation"]
    
```

## Vision-Language Models (VLMs)

```mermaid
graph LR;
    VLMs-->n0["correlations between images and texts"]
    n0-->n1["Contrastive Learning Models"]
    n1-->CLIP
    n1-->ALIGN
    n0-->n2["Generative Pre-training Models"]
    n2-->ViBERT
    n2-->VL-BEiT
    n1-->Flamingo/GIT
    n2-->Flamingo/GIT
    n0-->n3["Transformative Models"]
    n3-->BLIP/BLIP-2
    
```

## Large Multimodal Models (LMMs)

```mermaid
graph LR;
    LMMs-->n0["combnine image, text, depth, thermal, audio"]
    n0-->ImageBind
    n0-->NExT-GPT/Audio-GPT/SpeechGPT
    n0-->ULIP
```


![img](/assets/source/image/blog/foundation%20models%20for%20robotics.png)
