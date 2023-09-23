---
title: "Use Jekyll to Build Static Website"
tags: Jekyll
categories: Tech
header:
  teaser: /assets/source/image/teaser/jekyll.png
---

A note for writing down useful commands and concepts of Jekyll during the development of this website. Might constantly update it...

## Some useful commands

node repository
```console
npm config set registry http://registry.npmjs.org/ --global

npm cache clear --force

npm install --verbose
```

Jekyll build & deploy
```console
bundle install

bundle exec jekyll build 

bundle exec jekyll serve

# build options: --trace --profile --lsi
# serve options: --incremental --livereload
```



## [Jekyll][jekyll] notes

Further details in [udemy tutorial](https://www.udemy.com/course/static-website-generator-fast-secure-sites-blogs-with-jekyll/)
 - YAML front matter
   - a form of yaml that Jekyll uses for maintaining information about a page and its content.
   - frontmatter blocks always appear at the top of the file
   - every file that has yaml frontmatter will be processed by Jekyll as special file
 - predefined and custom variables
   - site, page and content
     - site variable is a global variable and contains data about the page
       - site.pages
       - site.posts
       - site.data
 - liquid templating language
   - use to process templates and output content
   - markup in Liquid 
     - output markup: {{site.title}}
     - tag markup: {% if page.title %} {% endif %}
 - lifecycle:
   - read _config.yml
   - read all the other files then checks for YAML Front matter
   - uses the Liquid templating language to process the content and templates
   - read the assets
   - generates the final output into the folder _site
 - Blog integrated:
   - manage a folder of text-files
   - require blog post files to be named according to:
     - YEAR-MONTH-DAY-title.MARKUP


[jekyll]: https://jekyllrb.com/docs/

[tutorial]: https://www.udemy.com/course/static-website-generator-fast-secure-sites-blogs-with-jekyll/

