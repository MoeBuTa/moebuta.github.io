---
title: "Introduction to Generative AI 2"
tags: AI LLM
categories: Tech
---

AI that can produce high quality content, such as text, images, and audio. [Link](https://www.coursera.org/learn/generative-ai-for-everyone/lecture/chD5R/welcome)

## Prompting an LLM in code

Instructions:
1. For each of the two code cells below, click on the cell then hit Shift+Enter on your keyboard to run the code (or if on a mobile device, press 'play' button).
2. Optionally edit the prompt, and try again!

**Code cell 1:** Set up programming environment to use code to send prompts to OpenAI's cloud-hosted service.

```python
import openai
import os

openai.api_key = os.getenv("OPENAI_API_KEY")

def llm_response(prompt):
    response = openai.ChatCompletion.create(
        model='gpt-3.5-turbo',
        messages=[{'role':'user','content':prompt}],
        temperature=0
    )
    return response.choices[0].message['content']
```

**Code cell 2:** Define a prompt that will classify the sentiment of a restaurant review.
```python
prompt = '''
    Classify the following review 
    as having either a positive or
    negative sentiment:

    The banana pudding was really tasty!
'''

response = llm_response(prompt)
print(response)
```
output: Positive sentiment


## Reputation monitoring system

Instructions:
1. For each of the four code cells below, click on the cell then hit Shift+Enter on your keyboard to run the code (or if on a mobile device, press 'play' button).
2. Optionally edit the reviews in Code cell 2, and try again (rerun the 2nd, 3rd and 4th code cells)!  

**Code cell 1:** Set up programming environment to use code to send prompts to OpenAI's cloud-hosted service. 
```python
import openai
import os 

openai.api_key = os.getenv("OPENAI_API_KEY")

def llm_response(prompt):
    response = openai.ChatCompletion.create(
        model='gpt-3.5-turbo',
        messages=[{'role':'user','content':prompt}],
        temperature=0
    )
    return response.choices[0].message['content']
```

**Code cell 2:** Create a list of reviews. 
```python
all_reviews = [
    'The mochi is excellent!',
    'Best soup dumplings I have ever eaten.',
    'Not worth the 3 month wait for a reservation.',
    'The colorful tablecloths made me smile!',
    'The pasta was cold.'
]

all_reviews
```

**Code cell 3:** Classify the reviews as positive or negative. 
```python
all_sentiments = []
for review in all_reviews:
    prompt = f'''
        Classify the following review 
        as having either a positive or
        negative sentiment. State your answer
        as a single word, either "positive" or
        "negative":

        {review}
        '''
    response = llm_response(prompt)
    all_sentiments.append(response)

all_sentiments
```

**Code cell 4**: Count the number of positive and negative reviews 
```python
num_positive = 0
num_negative = 0
for sentiment in all_sentiments:
    if sentiment == 'positive':
        num_positive += 1
    elif sentiment == 'negative':
        num_negative += 1
print(f"There are {num_positive} positive and {num_negative} negative reviews.")
```

## Lifecycle

![gai-lifecycle](\assets\source\image\blog\gai-lifecycle.png)

## Improve performance

process - we repeatedly find and fix mistakes.

 - prompting
 - retrieval augmented generation (RAG)
   - give LLM access to external data sources
 - fine-tune models
   - adapt LLM to your task
 - pretrain models
   - train LLM from scratch


## Cost intuition

![llm-cost](\assets\source\image\blog\llm-cost.png)


## Advanced Technologies: Beyond prompting

### Retrieval Augmented Generation (RAG)

3 steps:
1. Given question, search relevant documents for answer
2. Incorporate retrieved text into an updated (augmented) prompt
3. Generate answer from the new prompt with additional context

Big Idea: LLM as reasoning engine
 - by providing relevant context in the prompt, we ask an LLM to read a piece of text, then process it to get an answer

### Fine tuning

to carry out a task that isn't easy to define in a prompt

 - summarise in certain style or structure
![llm-tune-1](\assets\source\image\blog\llm-tune-1.png)

 - mimicking a writing or speaking style
![llm-tune-2](\assets\source\image\blog\llm-tune-2.png)

 - help LLM gain specific knowledge
![llm-tune-3](\assets\source\image\blog\llm-tune-3.png)

 - get a smaller model to perform a task
   - lower cost/latency to deploy
   - can run on mobile/laptop
   - can work well with 500-100 examples


### Pretraining

For building a specific application:
 - option of last resort
 - could help if have a highly specialized domain


### Choosing a model

 - Model size
   - 1B parameters: pattern matching and basic knowledge of the world
     - restaurant review sentiment
   - 10B parameters: greater world knowledge. Can follow basic instructions
     - food order chatbot
   - 100B+ parameters: rich world knowledge. Complex reasoning
     - brainstorming partner
 - Closed or open source
   - closed source models (cloud programming interface)
     - easy to use in applications
     - more large/powerful models
     - relatively inexpensive
     - some risk of vendor lock-in
   - open-source models
     - full control over model
     - can run on your own device
     - full control over data privacy/access

## Instruction tuning and RLHF

![llm-tune-ins](\assets\source\image\blog\llm-tune-ins.png)


![llm-tune-rlhf](\assets\source\image\blog\llm-tune-rlhf.png)

## Tool use and agents

![llm-tool-use](\assets\source\image\blog\llm-tool-use.png)

![llm-tool-reason](\assets\source\image\blog\llm-tool-reason.png)

![llm-agents](\assets\source\image\blog\llm-agents.png)
