---
title: "TailwindCSS Notes"
tags: React NextJS Typescript TailwindCSS
categories: Tech
---
noting down tricky points in tailwindcss:
 - "content-center vs item-center vs place-content-center vs place-items-center", 
 - "align vs justify"

## content-center vs items-center vs place-content-center vs place-items-center

`content-center` and `place-content-center` are CSS utility classes for aligning content.
 - `content-center` works in **flex containers**,
 - `place-content-center`, though suggested for both **grid** and **flex**, **only affects flex containers**and not **grid 
containers**

Similarly, `items-center` only works on **grid container**.

## align vs justify

align is used to handle `vertical alignment`, while justify is used to handle `horizontal alignment`.