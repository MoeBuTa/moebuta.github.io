---
title: "Anime Summary 2023 Winter"
tags: Isekai Campus Comedy Adventure Fantasy War
categories: Anime
---

Here's a subjective summary of the anime I enjoyed during the 2023 Winter (October to December), along with my 
reasons for
watching each.

All comments and opinions are subjective.

{::options parse_block_html="true" /}

[//]: # ( 775 * 510)

{% assign items = site.data.anime.winter_23 %}

{% for item in items %}

## {{ item.Hepburn }}

{% assign stars = "" %}
{% for i in (1..item.level ) %}
{% assign stars = stars | append: "⭐" %}
{% endfor %}

Recommendation level: {{ stars }}
<br>


{{item.comment}}


![img]({{item.img}})

<div style="text-align: center; font-style: italic;">
{% if item.english_name == item.chinese_name %}
[{{item.chinese_name}}]({{item.sakura}}) <br>
{% elsif item.english_name != item.chinese_name and item.english_name == item.japanese_name %}

{{item.english_name}} <br>
[{{item.chinese_name}}]({{item.sakura}}) <br>

{% else %}
{{item.english_name}} <br> 
{{item.japanese_name}} <br> 
[{{item.chinese_name}}]({{item.sakura}}) <br>
 {% endif %}

(season {{item.season}}, {{item.status}})
</div>


{% endfor %}




