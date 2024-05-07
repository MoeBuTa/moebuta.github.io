---
title: "Progress Meeting Notes 05/06"
tags: PhD Robotics LLM RAG
categories: PhD
imgUrl: /assets/source/image/blog/
---


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

![img]({{page.imgUrl}}eyesim-seq.jpg)


## Data for Retrieval

 - scene graph

![img]({{page.imgUrl}}scene-graph.png)

 - sensor-action graph (May grab data from hard coded script)
   - giving a set of sensor data, find k most similar sensor nodes.
     - may start with one sensor with a few range of values
       - e.g.: distance sensor, range [0, 1000], 0-200, 200-400, 400-600, 600-800, 800-1000, >1000
   - query these sensor nodes, list all connected action nodes with priorities, send to LLM

```mermaid

graph TD;
    A[Sensor Data 1] --> B(Action1)
    A --> C(Action2)
    A --> D(Action3)
    E[Sensor Data 2] --> F(Action4)
    E --> G(Action5)
    E --> B
    H[Sensor Data 3] --> C
    C --> G
    H --> A
```

 - trace logs

 - map


## Lawnmower / Maze

hard coded script vs zero-shot LLM vs LLM + RAG

![img]({{page.imgUrl}}lawnmower.png)


![img]({{page.imgUrl}}maze.png)

## Issues

 - Task scenarios brainstorming (May start with finding objects in the environment)
   - ~~have all the information of the environment (may not be so interesting)~~
     - ~~e.g.: the can is at (x,y), go and find it~~
     - ~~retrieve map, scene graph, sensor-action graph, trace logs.~~
   - have limited information of the environment
     - e.g.: there is a can behind the wall, try to find it
     - retrieve scene graph, sensor-action graph, trace logs.
   - no information of the environment
     - e.g.: try to find a can somewhere in the world
     - retrieve sensor-action graph, trace logs.
   - have incorrect information of the environment
     - e.g.: the can is at (x,y), but it is not there
     - retrieve map, scene graph, sensor-action graph, trace logs.
   - dynamic environment
     - e.g.: the can is moving, go and find it
 - ~~Prompt, retrieve content~~
 - LLM response parsing
   - response content
   - response format
 - User query



