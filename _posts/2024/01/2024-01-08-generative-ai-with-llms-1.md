---
title: "Generative AI with LLMs 1"
tags: AI LLM
categories: Tech
---

[Lecture Notes](/assets/materials/GenAILLM%20Slides/W1.pdf)

## Transformers

Learns the relevance of each word to each other word in a sentence.

### Simplified architecture
![transformer-simplified](/assets/source/image/blog/transformer-simplified.png)

![transformer-tokenizer](/assets/source/image/blog/transformer-tokenizer.png)

![transformer-embedding](/assets/source/image/blog/transformer-embedding.png)

a trainable vector embedding space, a high-dimensional space where each token is represented as a vector and occupies a unique location within that space. 

Each token ID in the vocabulary is matched to a multi-dimensional vector, 

these vectors **learn to encode the meaning and context of individual tokens in the input sequence**.

![transformer-pos](/assets/source/image/blog/transformer-pos.png)
by adding the positional encoding, you preserve the information about the word order and don't lose the relevance of the position of the word in the sentence.

![transformer-self](/assets/source/image/blog/transformer-self.png)
the model analyzes the relationships between the tokens in your input sequence. 

this allows the model to attend to different parts of the input sequence to better capture the contextual dependencies between the words. 

The self-attention weights that are learned during training and stored in these layers reflect the importance of each word in that input sequence to all other words in the sequence.

**multiple** sets of self-attention weights or heads are learned in parallel independently of each other.

each self-attention head will learn a different aspect of language. 
 - For example, one head may see the relationship between the people entities in our sentence. 
 - Whilst another head may focus on the activity of the sentence. 
 - Whilst yet another head may focus on some other properties such as if the words rhyme.

![transformer-ffn](/assets/source/image/blog/transformer-ffn.png)

the output is processed through a fully-connected feed-forward network. 

The output of this layer is a vector of logits proportional to the probability score for each and every token in the tokenizer dictionary. 

You can then pass these logits to a final softmax layer, where they are normalized into a probability score for each word. This output includes a probability for every single word in the vocabulary,

### Detailed architecture
![transformer-arch](/assets/source/image/blog/transformer-arch.png)

