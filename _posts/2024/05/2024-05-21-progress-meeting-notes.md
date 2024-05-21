---
title: "Progress Meeting Notes 05/21"
tags: PhD Robotics LLM RAG
categories: PhD
imgUrl: /assets/source/image/blog/
---


## Progresses

 - Implemented Manual Control
 - Replaced distance sensors with Lidar data line plots saving
 - Reworked Safety Module based on the lidar data
 - developed LLM hard-coded pipeline
 - Will test the pipeline with LLM once the prompt design is finished

## Issues

 - VWSetSpeed has deviations in time
   - May be due to the time taken to set the speed
     - Try turning 180 degrees - with 60 degree/s, 3 seconds, only approximately 120 degrees turned
 - Graph for RAG
   - Human psychology seems a good idea to prompt LLM 
     - how to collect data
       - from camera image / bird view screenshots, then feed into LLM to get a description of the scene and store 
         into the database
   - How to construct the graph
     - we have spatial / temporal relationships, but can be inferred from csv data already.
     - 
     - ontology?
     