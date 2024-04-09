---
title: "Progress Meeting Notes 04/08"
tags: PhD Robotics LLM
categories: PhD
imgUrl: /assets/source/image/blog/
---


## Project Progress

### LLMs
- Setting up LLM environment locally (llama2-7b-chat).
- Working with Pascal to develop self-hosted LLMs (developing API).
- [[WA Data & LLM Platform]](https://llm.nlp-tlp.org/)
- [[LLM API]](https://api.nlp-tlp.org/redoc/#tag/queue_task)
- [[Bring LLM to WA Community]](https://uwa-nlp-tlp.gitbook.io/llm-tutorial)
```mermaid
graph LR;
    Client-->|LLMTaskRequest|APIServer;
    APIServer-->|Response|Client;
    APIServer-->|QueueTasks|TaskQueue;
    LLMWorker-->|GetTask|TaskQueue;
    TaskQueue-->|PopTask|LLMWorker;
    LLMWorker-->|Response|APIServer;
```

### Simulator
- Setting up basic environment for the project.
  - Dockerizing the simulator.
  - prepare for integrations.

## TODOs
- [[Paper]](https://www.overleaf.com/project/660fbf6b9ea6dbdd103450d1).
  - Working with Xiangrui. [[paper]](https://www.overleaf.com/project/660e10a7a7150a1f69475262) being accepted by 
    IEEE IV 2024 conference.
  - [[ITSC]](https://its.papercept.net/conferences/scripts/start.pl) if possible (due 1st May), Suggestions?
  - Ideas? Is latency a good topic? 
    - Metrics?
      - LLM computing time, vehicle responding time, end-to-end responding time
    - what about other ideas? Accuracy?

- Research Proposal:
  - Construct a framework for integrating LLM with robotics in the context of navigation.
      - *Reasoning Accuracy: 
        - Multi-modal LLMs vs text only LLMs - Spatial-temporal reasoning issue.
        - Common way in LLMs: Prompting, RAG, and Fine-tuning.
      - Reasoning Latency:
        - On-premise open-source LLMs vs Cloud-based LLMs.
        - Scaling LLM size (light-LLM)
      - Reasoning security:
        - Evaluation framework.
    - Method:
      - Eyesim, Carla, ShuttleBus, Indoor robot?
      - LLM optimisations:
        - Prompting: Chain of thoughts, Visual QA
        - *RAG: relational, knowledge graph, vectorstore, attention.
        - Fine-tuning?

## Additional
- Add name on paper?
- Kaya account for using GPUs.
- 
