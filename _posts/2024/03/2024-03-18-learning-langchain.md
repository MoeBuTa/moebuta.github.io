---
title: "Learning LangChain"
tags: LLM LangChain RAG
categories: Tech
imgUrl: "/assets/source/image/blog/"
---

[LangChainForLLM](https://learn.deeplearning.ai/courses/langchain/lesson/1/introduction)

[[Learning RAG]]({{ site.baseurl }}/blog/2024/03/learning-langchain-for-rag)

open-source development framework for LLM applications

Focused on composition and modularity

key value adds:
 - modular components
 - use cases: common ways to combine components.

![img]({{ page.imgUrl }}langchain-components.png)


### Models, Prompts and Output Parsers

#### Prompt Templates

```python
from langchain.chat_models import ChatOpenAI

# To control the randomness and creativity of the generated
# text by an LLM, use temperature = 0.0
chat = ChatOpenAI(temperature=0.0, model=llm_model)

template_string = """Translate the text \
that is delimited by triple backticks \
into a style that is {style}. \
text: ```{text}```

prompt_template.messages[0].prompt

prompt_template.messages[0].prompt.input_variables

customer_messages = prompt_template.format_messages(
                    style=customer_style,
                    text=customer_email)
"""
```

#### Output Parsers

```python
from langchain.output_parsers import ResponseSchema
from langchain.output_parsers import StructuredOutputParser


gift_schema = ResponseSchema(name="gift",
                             description="Was the item purchased\
                             as a gift for someone else? \
                             Answer True if yes,\
                             False if not or unknown.")
delivery_days_schema = ResponseSchema(name="delivery_days",
                                      description="How many days\
                                      did it take for the product\
                                      to arrive? If this \
                                      information is not found,\
                                      output -1.")
price_value_schema = ResponseSchema(name="price_value",
                                    description="Extract any\
                                    sentences about the value or \
                                    price, and output them as a \
                                    comma separated Python list.")

response_schemas = [gift_schema, 
                    delivery_days_schema,
                    price_value_schema]
                    
output_parser = StructuredOutputParser.from_response_schemas(response_schemas)


review_template_2 = """\
For the following text, extract the following information:

gift: Was the item purchased as a gift for someone else? \
Answer True if yes, False if not or unknown.

delivery_days: How many days did it take for the product\
to arrive? If this information is not found, output -1.

price_value: Extract any sentences about the value or price,\
and output them as a comma separated Python list.

text: {text}

{format_instructions}
"""

prompt = ChatPromptTemplate.from_template(template=review_template_2)

messages = prompt.format_messages(text=customer_review, 
                                format_instructions=format_instructions)
print(messages[0].content)
"""
```

```python
response = chat(messages)
print(response.content)
output_dict = output_parser.parse(response.content)
output_dict.get('delivery_days')
```
### Memory
ConversationBufferMemory
```python
from langchain.chat_models import ChatOpenAI
from langchain.chains import ConversationChain
from langchain.memory import ConversationBufferMemory

llm = ChatOpenAI(temperature=0.0, model=llm_model)
memory = ConversationBufferMemory()
conversation = ConversationChain(
    llm=llm, 
    memory = memory,
    verbose=True
)

conversation.predict(input="Hi, my name is Andrew")
print(memory.buffer)
memory.load_memory_variables({})
memory.save_context({"input": "Hi"}, 
                    {"output": "What's up"})
```

ConversationSummaryMemory
```python
# create a long string
schedule = "There is a meeting at 8am with your product team. \
You will need your powerpoint presentation prepared. \
9am-12pm have time to work on your LangChain \
project which will go quickly because Langchain is such a powerful tool. \
At Noon, lunch at the italian resturant with a customer who is driving \
from over an hour away to meet you to understand the latest in AI. \
Be sure to bring your laptop to show the latest LLM demo."

memory = ConversationSummaryBufferMemory(llm=llm, max_token_limit=100)
memory.save_context({"input": "Hello"}, {"output": "What's up"})
memory.save_context({"input": "Not much, just hanging"},
                    {"output": "Cool"})
memory.save_context({"input": "What is on the schedule today?"}, 
                    {"output": f"{schedule}"})
```

### Chains

LLMChain

SimpleSequentialChain

![img]({{ page.imgUrl }}simple-sequential-chain.png)

SequentialChain

![img]({{ page.imgUrl }}sequential-chain.png)

Router Chain

![img]({{ page.imgUrl }}router-chain.png)


### Question and Answer (*important*)

#### Embeddings
![img]({{ page.imgUrl }}langchain-embeddings.png)

#### Vector Database
![img]({{ page.imgUrl }}langchain-vector-database.png)
![img]({{ page.imgUrl }}langchain-vector-database-2.png)

#### Retrieve Methods
![img]({{ page.imgUrl }}langchain-stuff-method.png)
![img]({{ page.imgUrl }}langchain-additional-method.png)

### Agents (*important*)

```python
from langchain.agents import tool
from datetime import date


@tool
def time(text: str) -> str:
    """Returns todays date, use this for any \
    questions related to knowing todays date. \
    The input should always be an empty string, \
    and this function will always return todays \
    date - any date mathmatics should occur \
    outside this function."""
    return str(date.today())
    
agent= initialize_agent(
    tools + [time], 
    llm, 
    agent=AgentType.CHAT_ZERO_SHOT_REACT_DESCRIPTION,
    handle_parsing_errors=True,
    verbose = True)
    
try:
    result = agent("whats the date today?") 
except: 
    print("exception on external access")
```


