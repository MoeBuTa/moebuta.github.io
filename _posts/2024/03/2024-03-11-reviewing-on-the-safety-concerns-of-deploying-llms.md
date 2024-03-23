---
title: "Reviewing On the Safety Concerns of Deploying LLMs/VLMs in Robotics"
tags: AI Robotics Cybersecurity
categories: Literature
imgUrl: "/assets/source/image/blog/"
---

Reviewing _On the Safety Concerns of Deploying LLMs/VLMs in Robotics: Highlighting the Risks and Vulnerabilities_ [
[Paper]](https://arxiv.org/pdf/2402.10340.pdf)


LLM security issues

 - hallucination, illusion 
 - ambiguity of contextual information provided by text or images 
 - template-based prompt format - lack of flexibility - misunderstanding of prompts
 - multi-modality in prompt input - higher failure risk

## Basic architecture
```mermaid

graph LR;
    Inputs-->|Visual|VLMs/LLMs
    Inputs-->|Textual|VLMs/LLMs
    VLMs/LLMs-->|Instructions|Robot
    Robot-->|Action|Surroundings
    Surroundings-->|Feedback|Robot
```

## Vulnerabilities and Attacks
```mermaid

graph LR;
    Vulnerabilities-->n1["Inaccurate Data Acquisition or Interpretation"]
    Vulnerabilities-->n2["Misinterpretation of Human Instructions"]
    Vulnerabilities-->n3["Erroneous Command Generation"]
```

![img]({{ page.imgUrl }}llm-vlm-attack.png)


## Evaluation

```mermaid

graph LR;
    n1["Prompt Only"]-->KnowNo
    KnowNo-->|robust|Simple
    KnowNo-->|reduce to 18.7%|Stealth
    KnowNo-->|reduce to 32.0%|Adjective
    KnowNo-->|reduce to 15.3%|Noun
    
    n2["Multi-modal"]-->VIMA
    n2-->Instruct2Act
```
![img]({{ page.imgUrl }}vima-3gen-evaluation.png)

![img]({{ page.imgUrl }}vima-comb.png)

![img]({{ page.imgUrl }}instruct2act-evaluation.png)
