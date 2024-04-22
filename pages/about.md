---
title: "About MoeBuTa"
layout: about
toc: true
permalink: /about
---

{::options parse_block_html="true" /}


## Intro

<a href="https://moebuta.github.io/" >
<img align='right' src='/assets/source/anime/image/elaina.png' width="150" height="auto" >
</a>


I'm MoeBuTa (nickname) / Wenxiao (legal name).

A PhD student at UWA.

Python is my primary programming language for projects.

A graduate from UWA with a Master's degree in Software Engineering.

Also, a weeb, a fingerstyle guitar enthusiast, and a big fan of video games.

...
- 🔗 My website: [https://moebuta.github.io/](https://moebuta.github.io/)
- 📫 You can reach me at [moebutamail@gmail.com](moebutamail@gmail.com) or [wenxiao.zhang@research.uwa.edu.au](wenxiao.zhang@research.uwa.edu.au)
- 🖇️ Connect with me on LinkedIn: [https://www.linkedin.com/in/wenxiao-zhang-a0801b206/](https://www.linkedin.com/in/wenxiao-zhang-a0801b206/)


## News

<details open markdown="1">
<summary></summary>
{% assign updates = site.data.about.news %}

{% for item in updates %}

<div class="{{item.theme}}" markdown="1">

<b><i class="fas fa-fw fa-{{item.icon}}"></i>  {{item.date}}</b>

{{item.content}}

</div>

{% endfor %}

</details>

## Research Interests

1. Adapting LLMs to specialised domains (robotics).
2. LLM Prompting.
3. LLM In-context Learning through RAG. 
4. LLM Supervised Fine-tuning.

## Projects

<details open markdown="1">
<summary></summary>
{% assign projects = site.data.about.projects %}

{% for item in projects %}

{{item.icon}} {{item.project}} - {{item.description}}

{% endfor %}


[![Top Langs](https://github-readme-stats.vercel.app/api/top-langs/?username=MoeBuTa&layout=compact&theme=tokyonight&card_width=500&langs_count=10)](https://github.com/MoeBuTa/github-readme-stats)

[![MoeBuTa's GitHub stats](https://github-readme-stats.vercel.app/api?username=MoeBuTa&theme=tokyonight&rank_icon=github&card_width=500)](https://github.com/MoeBuTa/github-readme-stats)

<img src="https://counter.seku.su/cmoe?name=moebuta.github.io&theme=r34" /><br>

</details>

## Skills

<details open markdown="1">
<summary></summary>
{% assign skills = site.data.about.skills %}

<details open markdown="1">
<summary> **Currently using/learning**
</summary>
 - **Programming**: {{skills.current.programming}}
 - **Version Control**: {{skills.current.vcs}}
 - **Web Development**: {{skills.current.web}}
 - **Automation**: {{skills.current.automation}}
 - **Technique**: {{skills.current.techniques}}
</details>


<details open markdown="1">
<summary> **Other knowledge**
</summary>
 - **Programming**: {{skills.other.programming}}
 - **Version Control**: {{skills.other.vcs}}
 - **Web**: {{skills.other.web}}
 - **Frameworks**: 
   - Simulation: {{skills.other.frameworks.simulation}}
   - Visualisation: {{skills.other.frameworks.visualisation}}
   - Data Processing: {{skills.other.frameworks.data_processing}}
   - Machine Learning: {{skills.other.frameworks.machine_learning}}
 - **Certification**: {{skills.other.certification}}
 - **Text Editor**: {{skills.other.text_editor}}
 - **Hardware**: {{skills.other.hardware}}
</details>

</details>

## Languages
<details open markdown="1">
<summary></summary>
{% assign languages = site.data.about.languages %}
- **Chinese**: {{languages.chinese}}
- **English**: {{languages.english}}
- **Japanese**: {{languages.japanese}}
</details>
## Games

<details open markdown="1">
<summary></summary>

{% assign games = site.data.about.games %}
<img src="assets/source/image/blog/game.png" /><br>

**Currently Playing**:
 - {{games.current}}

**Previously Played**:
 - **Gacha**:
   - {{games.previous.gacha}}
 - **Single-player (Offline)**:
   - {{games.previous.single}}
 - **Multiple-Player**:
   - {{games.previous.multiple}}
 - **Mini-Game**:
   - {{games.previous.mini}}
 - **Gal-Game**:
   - {{games.previous.gal}}
</details>

 
[UWA]: https://www.uwa.edu.au/
[AWS]: https://www.credly.com/badges/82057be6-157e-4f61-9707-8d84f519eef7/linked_in_profile