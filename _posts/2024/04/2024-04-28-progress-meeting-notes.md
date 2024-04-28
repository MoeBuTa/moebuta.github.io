---
title: "Progress Meeting Notes 04/26"
tags: PhD Robotics LLM RAG
categories: PhD
imgUrl: /assets/source/image/blog/
---

 - Reviewed existing RAG methods
   - embedding model
 - Reviewed existing RLHF methods
   - rewarding model
 - Reviewed existing finetuning methods
   - prompt/instruction tuning
   - parameter tuning

## RAG

![img]({{ page.imgUrl }}rag-arch.png)

 - Frozen LLM, focus on RAG and RLHF 
 - RAG: assist LLM to generate in-context responses
   - main questions:
     - how and what to retrieve: 
       - similarity for unstructured
       - sql for relational
       - cypher for graph
     - when to retrieve:
       - retrieve after scope is obtained
       - let LLM decide
   - other questions:
     - how to preprocess
       - system prompt: setup roles, tasks, workflow, restrictions
     - how to prompt
     - how to pass context
     - how to post-process
       - json, reference list, etc.
     - how to verify
       - accuracy, relevance to the knowledge base
 - RLHF: Mitigate hallucinations


Eyesim
 - Documents for retrieval
   - [Assignments](https://roblab.org/courses/mobrob/labs/)
   - [API](https://roblab.org/eyebot/robios.html)
   - Data collected during the simulation
 - Structure brainstorming

```mermaid
graph TD;
    R((Robot))-->|query|A[Retriever]
    R-->|Update|D([State Logs])
    A-->|Retrieve|C([Knowledge Base])
    A-->|Retrieve|D
    C-->E[Post-retriever]
    D-->E
    E-->|Prompt|L[LLM]
    L-->|Response|R
```

## RLHF

## Use cases brainstorming
 - Vehicle
   - Document:
   - State Logs:
 - Arm
   - Document:
   - State Logs:
 - Humanoid
   - Document:
   - State Logs:
