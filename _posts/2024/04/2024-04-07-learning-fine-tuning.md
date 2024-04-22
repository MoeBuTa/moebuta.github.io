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

## Conclusion

### Practical approach to finetuning

1. figure out your task
2. collect data related to the task's inputs/outputs
3. Generate data if you don't have enough data
4. finetune a small model (400m - 1b)
5. vary the amount of data you give the model
6. evaluate your LLM to know what's going well vs not
7. collect more data to improve 
8. increase task complexity
9. increase model size for performance

![img]({{ page.imgUrl }}conclusion-finetuning.png)

![img]({{ page.imgUrl }}conclusion-finetuning-compute.png)