---
title: "Learning Fine-tuning"
tags: LLM
categories: Tech
imgUrl: /assets/source/image/blog/
---

[Learning Fine-tuning](https://learn.deeplearning.ai/courses/finetuning-large-language-models/lesson/1/introduction)

[LAMINI](https://www.lamini.ai/)

## Fine-tuning principles

![img]({{ page.imgUrl }}finetuning-demo.png)

![img]({{ page.imgUrl }}finetuning-comparsion.png)

![img]({{ page.imgUrl }}promptvsfinetuning.png)


## Benefits

![img]({{ page.imgUrl }}finetuning-benefit.png)

## Tasks

![img]({{ page.imgUrl }}finetuning-task.png)

![img]({{ page.imgUrl }}finetuning-steps.png)

## Instruction finetuning


### Definition
![img]({{ page.imgUrl }}instruction-finetuning.png)


### Data generation
![img]({{ page.imgUrl }}intruction-finetuning-data-generation.png)
can use open-source tools or chatgpt

## Training process

![img]({{ page.imgUrl }}training-llm.png)


```python
for epoch in range(epochs):
    for batch in train_dataloader:
        outputs = model(**batch)
        loss = outputs.loss
        loss.backward()
        optimizer.step()
```


## Evaluation

### Introduction

![img]({{ page.imgUrl }}evaluating-llm.png)

### Benchmarks

![img]({{ page.imgUrl }}llm-evaluation-benchmark.png)

### Error Analysis

![img]({{ page.imgUrl }}llm-evaluation-error-analysis.png)

