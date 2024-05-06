---
title: "Progress Meeting Notes 05/06"
tags: PhD Robotics LLM RAG
categories: PhD
imgUrl: /assets/source/image/blog/
---


## Literature reviews

[Overleaf](https://www.overleaf.com/project/660fbf6b9ea6dbdd103450d1)

## Asynchronous LLM Request / Control
 - thread 1 running rule-based safety checks
 - thread 2 running LLM control
 - thread 3 running user query


```mermaid

graph TD;
    A([Safety Thread]) --> |Distance Sensor < 100|B[Safety Event]
    B --> |Speed=0|R((Robot))
    B --> |Trigger|D[LLM Request Event]
    D --> |LLM Request|C([LLM Control Thread])
    C --> |LLM Response|E([User Query Thread])
    E --> |Trigger|D
    C --> |Control|R
    R --> |Update|A
    R --> |Trigger|D
    
    
    
    
```

## Lawnmower, Maze

hard coded script vs zero-shot LLM vs LLM + RAG

## Issues

 - Prompt, retrieve content
 - LLM response parsing
   - response content
   - response format
 - User query

