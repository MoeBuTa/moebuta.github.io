---
title: "LLM For Embodied Navigation"
tags: LLM Navigation
categories: Tech
---

Notes for paper "The Development of LLMs for Embodied Navigation".

## Contributions

 - Summarized the evolutionary trajectory of **LLMs** and their applications in **embodied intelligence**.

 - Presented a selection of currently popular benchmarks and conducted a comparative evaluation among them.

 - Provided a comparative analysis and introduction of commonly used datasets in LLMs for Embodied Intelligence.

## Background

### LLM
- **Evolution of LLMs:**
 - Represents a milestone in Natural Language Processing (NLP) and Machine Learning.
 - Examines early NLP and machine learning stages, including methods like Bag-of-Words (BoW).
 - Describes the limitations of simpler algorithms like N-grams and decision trees.

- **Word Embedding Models:**
 - Introduces word embedding models, such as Word2Vec and GloVe, around 2013.
 - Highlights Word2Vec's efficiency in capturing word relationships and GloVe's optimization for large datasets.
 - Discusses the shift towards incorporating pre-trained word vectors into sequence models like RNNs and LSTMs.

- **Sequence Models and Transformers:**
 - Describes challenges with RNNs and the emergence of specialized variants like LSTMs and GRUs.
 - Introduces the Transformer architecture in 2017, emphasizing its scalability and speed compared to RNNs.
 - Mentions subsequent models like Vision Transformer (ViT) and OpenAI's CLIP, expanding Transformer's use to visual processing tasks.

- **Large Language Models (LLMs):**
 - Discusses BERT and GPT series, including their applications in text generation tasks.
 - Highlights "zero-shot learning" capabilities of GPT models and the need for fine-tuning in certain tasks.

### Embodied Intelligence
- **Embodied Intelligence:**
 - Defines Embodied Intelligence as the understanding and development of intelligent agents interacting with their environment.
 - Discusses leveraging NLP advancements for converting human instructions to formats interpretable by embodied agents.
 - Explores the merging of LLMs, like GPT-3, with Embodied Intelligence for enhanced context-awareness.

- **High-level and Low-level Controls:**
 - Explains the importance of high-level and low-level controls in intelligent agent design.
 - Differentiates between high-level controls (task scheduling, strategy development) and low-level controls (direct command over operational functions).
 - Highlights applications of these controls in terrain recognition, machinery lifespan prediction, and gaze mechanisms emulation.

- **Integration of Controls:**
 - Emphasizes the need for harmonious integration of high-level and low-level controls for developing robust and generalized intelligent agents.
 - Provides an example of the LM-Nav model, combining self-supervised robotic control, vision-language model, and a large language model for long-horizon planning.

- **Multi-Agent Systems:**
 - Mentions research on multi-agent systems focusing on cooperation issues.
 - Acknowledges contributions to broadening tasks achievable by agents, enhancing work efficiency, and improving real-world applicability.

- **Challenges in Embodied Intelligence:**
 - Discusses the challenge of designing agents capable of real-time learning and adaptation to their environment.
 - Highlights the importance of sensory-motor coordination and morphological computation in embodied cognition.
 - Describes the use of machine learning, reinforcement learning, and evolutionary algorithms for creating adaptive agents.


## Methodologies

 - **Grounded Language Understanding:**
   - bridging high-level language and low-level actions: integrate with sensors, databases, or simulated 
     environments to generate and interpret language applicable to real-world scenarios.
     - LLM-Grounder: 3D visual grounding (Yang et al.)
     - Carta et al. boost LLM using RL
     - challenges: the integration of text, images, and sensor data, latency reduction for real-time applications, 
       and maintaining training efficiency without sacrificing performance.

 - **Few-Shot Planning:**
   - effective planning and decision-making in new tasks with minimal sample data.
     - ESC, LLM-Planner, CoT, LLM-DP: enabling embodied agents to execute complex tasks in visually rich environments
   


 - **Zero-Shot Navigation:**
   - Crucial Functions: Natural Language Understanding, Dynamic Planning, Multimodal Input, Real-time Interaction, 
     Task Generalization
   - 2 categories:
     - Category 1: LLMs as Planners 
       - LLMs directly make plans and decide what actions to take.
       - Exploration policies help guide the agents based on these plans.
     - ![llm-zero-shot-navi-2](/assets/source/image/blog/llm-zero-shot-navi-2.png)
     - Category 2: LLMs Analyzing Data
       - LLMs look at pictures or text to find important information.
       - This important info helps agents decide what actions to take using exploration policies.
       - ![llm-zero-shot-navi-3](/assets/source/image/blog/llm-zero-shot-navi-3.png)
   - Approaches: 
     - CoW (CLIP on Wheels), ZSON, 
     - LM-Nav, CLIP-NAV, SQA3D, L3MVN, VLMAP, OVRL, ESC, NavGPT, VELMA, 
       A^2Nav, MiC, SayNav, 
     - VoxPoser, ALFRED, PaLM-E, RT-2
     - ![llm-zero-shot-navi-1](/assets/source/image/blog/llm-zero-shot-navi-1.png)







