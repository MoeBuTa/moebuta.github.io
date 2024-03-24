---
title: "Reviewing DriveLLM"
tags: LLM Robotics
categories: Literature
imgUrl: "/assets/source/image/blog/"
---

Reviewing _DriveLLM: Charting the Path Toward Full Autonomous Driving With Large Language Models_ [[Paper]](https://ieeexplore.ieee.org/stamp/stamp.jsp?tp=&arnumber=10297415)








## General Workflow
```mermaid

graph LR;
    Observation-->Inference;
    Inference-->CyberEvaluation;
    CyberEvaluation-->Action;
    Action-->PhysicalEvaluation;
    CyberEvaluation-->Self-reflection;
    PhysicalEvaluation-->Self-reflection;
```

![img]({{ page.imgUrl }}drivellm%20high-level%20framework.png)

![img]({{ page.imgUrl }}drivellm%20reasoning.png)

![img]({{ page.imgUrl }}drivellm%20architecture.png)

## Observation
```mermaid

graph TD; 
    Observation-->n1["Decision-making ActionSpace"];
    Observation-->MapInformation;
    Observation-->PerceptionResults;
    Observation-->VehicleStates;
    Observation-->n2["Real-time Data"];
    n2-->WeatherCondition;
    n2-->n3["Long-term memory (previous learned mistakes)"];
    Observation-->PassengerRequests;
```

## Reasoning
```mermaid

graph TD;
    Reasoning-->ActionGeneration;
    ActionGeneration-->slowing-down;
    ActionGeneration-->speeding-up;
    ActionGeneration-->pulling-over;
    ActionGeneration-->...
```

## Decision-making

```mermaid

graph LR;
    Decision-making-->n1["Time-based decision-making rule"];
    n1-->|InTime|n2["LLM-based Action"];
    n1-->|TimeOut|n3["Rule-based Action"];
    
```
![img]({{ page.imgUrl}}drivellm-decision-making.png)

![img]({{ page.imgUrl}}drivellm-rule-based-check.png)

## Self-reflection

```mermaid

graph LR;
    n1["Simulation Check System"]-->n2["self-reflection LLM 1"];
    n3["Physical Execution Result"]-->n4["self-reflection LLM 2"];
    n2-->LSTM;
    n4-->LSTM;
```




## Attack Scenario
```mermaid

graph LR;
    n1["Adversarial Attack via Human-Machine Interactions"]-->n2["Prompt Injection"]
    n2-->n3["override safety check"]
    n2-->n4["override foundational programming"]
    n2-->n5["leverage emergency situations"]
```


