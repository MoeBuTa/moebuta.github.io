---
title: "Literature Review Notes"
tags: LLM Robotics
categories: Literature
---


## Survey

_Toward General-Purpose Robots via Foundation Models: A Survey and Meta-Analysis_ [[Paper]](https://arxiv.org/pdf/2312.08782.pdf)

```mermaid
graph LR;
Start["Robotic System"]-->n1["Robot Perception"];
n1-->n1.1("Passive Perception");

n1-->n1.2("State Estimation (SLAM)");
n1.2-->n1.2.1("geometry-based solutions (traditional)");
n1.2-->n1.2.2("supervised/self-supervised methods");


n1-->n1.3("Active Perception");


Start-->n2["Robot Decision-making and Planning"];
n2-->n2.1("Classical Planning");
n2.1-->n2.1.1("Search-based Planning");
n2.1-->n2.1.2("Sampling-based Planning");

n2-->n2.2("Learning-based Planning");
n2.2-->n2.2.2("Reinforcement Learning")


Start-->n3["Robot Action Generation"];
n3-->n3.1("Classical Control");
n3.1-->n3.1.1("Proportional-Integral-Derivative (PID)");
n3.1-->n3.1.2("Model Predictive Control(MPC)");
n3.1-->n3.1.3("Model Predictive Path Integral (MPPI)");

n3-->n3.2("Learning-based Control");
n3.2-->n3.2.1("Imitation Learning");
n3.2-->n3.2.2("Reinforcement Learning");
```

![img](/assets/source/image/blog/foundation%20models%20for%20robotics.png)


_A Survey on Multimodal Large Language Models for Autonomous Driving_
[[Paper]](https://arxiv.org/abs/2311.12320)

![img]({{ page.imgUrl }}mllm-ad.png)
![img]({{ page.imgUrl}}recent-work-mlllm.png)

## DriveLLM

_DriveLLM: Charting the Path Toward Full Autonomous Driving With Large Language Models_ [[Paper]](https://ieeexplore.ieee.org/stamp/stamp.jsp?tp=&arnumber=10297415)


![img]({{ page.imgUrl }}drivellm%20high-level%20framework.png)

![img]({{ page.imgUrl }}drivellm%20reasoning.png)

![img]({{ page.imgUrl }}drivellm%20architecture.png)

### Observation
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

### Reasoning
```mermaid

graph TD;
    Reasoning-->ActionGeneration;
    ActionGeneration-->slowing-down;
    ActionGeneration-->speeding-up;
    ActionGeneration-->pulling-over;
    ActionGeneration-->...
```

### Decision-making

```mermaid

graph LR;
    Decision-making-->n1["Time-based decision-making rule"];
    n1-->|InTime|n2["LLM-based Action"];
    n1-->|TimeOut|n3["Rule-based Action"];
    
```
![img]({{ page.imgUrl}}drivellm-decision-making.png)

![img]({{ page.imgUrl}}drivellm-rule-based-check.png)

### Self-reflection

```mermaid

graph LR;
    n1["Simulation Check System"]-->n2["self-reflection LLM 1"];
    n3["Physical Execution Result"]-->n4["self-reflection LLM 2"];
    n2-->LSTM;
    n4-->LSTM;
```




### Attack Scenario
```mermaid

graph LR;
    n1["Adversarial Attack via Human-Machine Interactions"]-->n2["Prompt Injection"]
    n2-->n3["override safety check"]
    n2-->n4["override foundational programming"]
    n2-->n5["leverage emergency situations"]
```


### Evaluation

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


## Safety

_On the Safety Concerns of Deploying LLMs/VLMs in Robotics: Highlighting the Risks and Vulnerabilities_ [
[Paper]](https://arxiv.org/pdf/2402.10340.pdf)

![img]({{ page.imgUrl }}llm-vlm-attack.png)

![img]({{ page.imgUrl }}vima-3gen-evaluation.png)

![img]({{ page.imgUrl }}vima-comb.png)

![img]({{ page.imgUrl }}instruct2act-evaluation.png)


_How Secure Are Large Language Models (LLMs) for Navigation in Urban Environments?_ [[Paper]](https://arxiv.org/pdf/2402.09546.pdf)

![img]({{ page.imgUrl }}NPS-attack.png)

_Semantic anomaly detection with large language models_
[[Paper]](https://link.springer.com/content/pdf/10.1007/s10514-023-10132-6.pdf)
![img]({{ page.imgUrl }}anomaly-framework.png)
![img]({{ page.imgUrl }}anomaly-example.png)



