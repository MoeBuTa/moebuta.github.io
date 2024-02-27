---
title: "Tiktok Practice Questions"
tags: tiktok Python
categories: Interview
---

<div class="notice--primary" markdown="1">

#### <i class="fas fa-fw fa-lightbulb"></i> Update 2023/11/14

{: .no_toc }


Just contacted one of the hiring staff, and they said they only want to hire locals/PR for now. WTF? Why did they 
reach out to me and send me the OA in the first place?

![tiktokend](/assets/source/image/blog/tiktok-end.png)
</div>

Another OA for graduate program at Tiktok. The practice questions already felt difficult enough to me...

## Question 1

![tiktok1](/assets/source/image/blog/tiktok-1.png)

![tiktok1-1](/assets/source/image/blog/tiktok-1-1.png)

## Question 2

![tiktok2](/assets/source/image/blog/tiktok-2.png)

## Question 3 User-Friendly Password System

![tiktok3](/assets/source/image/blog/tiktok-3.png)


![tiktok3-1](/assets/source/image/blog/tiktok-3-1.png)
```python
#!/bin/python3

import math
import os
import random
import re
import sys



#
# Complete the 'authEvents' function below.
#
# The function is expected to return an INTEGER_ARRAY.
# The function accepts 2D_STRING_ARRAY events as parameter.
#

def authEvents(events):
    # Write your code here
    hash_value = 0
    res = []
    pwd = ''
    
    flag = False
    
    
    for event in events:
        event_type, event_param = event[0], event[1]
        
        if event_type == "setPassword":
            pwd = event_param
            hash_value = custom_hash(pwd)
                
        if event_type == "authorize":
            
            if hash_value == int(event_param):
                res.append(1)
            else:
                
                for i in range(127):
                    potential_char = chr(i)
                    potential_hash = custom_hash(pwd+potential_char)
                    if int(event_param) == potential_hash:
                        res.append(1)
                        flag = True
                        break
                if not flag:
                    res.append(0)
                flag = False
                
    return res
    
def custom_hash(param):
    prime = 131
    mod = 10**9 + 7
    hash_value = 0
    n = len(param)
    for i in range(n):
        char_value = ord(param[i])
        exponent = n - i - 1
        term = char_value * (prime ** exponent)
        hash_value = (hash_value + term) % mod
    return hash_value
    

if __name__ == '__main__':
    fptr = open(os.environ['OUTPUT_PATH'], 'w')

    events_rows = int(input().strip())
    events_columns = int(input().strip())

    events = []

    for _ in range(events_rows):
        events.append(input().rstrip().split())

    result = authEvents(events)

    fptr.write('\n'.join(map(str, result)))
    fptr.write('\n')

    fptr.close()

```


## Question 4 

![tiktok4](/assets/source/image/blog/tiktok-4.png)

![tiktok4-1](/assets/source/image/blog/tiktok-4-1.png)

```python
#!/bin/python3

import math
import os
import random
import re
import sys



#
# Complete the 'stockPairs' function below.
#
# The function is expected to return an INTEGER.
# The function accepts following parameters:
#  1. INTEGER_ARRAY stocksProfit
#  2. LONG_INTEGER target
#

def stockPairs(stocksProfit, target):
    # Write your code here
    sorted_stocks = sorted(stocksProfit)
    val_dict = {}
    pairs = set()
    for i, n in enumerate(sorted_stocks):
        diff = target - n
        if diff in val_dict and (n, diff) not in pairs:
            pairs.add((diff, n))
        val_dict[n] = i
    return len(pairs)
    

    
    

if __name__ == '__main__':
    fptr = open(os.environ['OUTPUT_PATH'], 'w')

    stocksProfit_count = int(input().strip())

    stocksProfit = []

    for _ in range(stocksProfit_count):
        stocksProfit_item = int(input().strip())
        stocksProfit.append(stocksProfit_item)

    target = int(input().strip())

    result = stockPairs(stocksProfit, target)

    fptr.write(str(result) + '\n')

    fptr.close()

```

## Question 5 

![tiktok5](/assets/source/image/blog/tiktok-5.png)

![tiktok5-1](/assets/source/image/blog/tiktok-5-1.png)