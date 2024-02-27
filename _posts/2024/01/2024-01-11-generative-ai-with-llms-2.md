---
title: "Generative AI with LLMs 2"
tags: AI LLM Fine-tuning
categories: Tech
---

[Lecture Notes](/assets/source/materials/deeplearning.ai/GenAILLM%20Slides/W2.pdf)

## Parameter Efficient Fine-tuning (PEFT)

updates only a small subset of parameters. This helps prevent catastrophic forgetting.

 - Selective:
   - select subset of initial LLM parameters to fine-tune
 - Re-parameterization
   - re-parameterize model weights using a low-rank representation (LoRA)
 - Additive
   - add trainable layers or parameters to model
     - adapters
     - soft prompts (prompt tuning)

## Low Rank Adaption of LLMs (LoRA)

![lora](/assets/source/image/blog/lora.png)


![lora-example](/assets/source/image/blog/lora-example.png)


![lora-example-1](/assets/source/image/blog/lora-example-1.png)


## Soft prompts


