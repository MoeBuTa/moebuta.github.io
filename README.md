# moebuta.github.io

[![GitHub Actions](https://github.com/MoeBuTa/moebuta.github.io/actions/workflows/jekyll.yml/badge.svg)](https://github.com/MoeBuTa/moebuta.github.io/actions)

npm config set registry http://registry.npmjs.org/ --global

npm cache clear --force

npm install --verbose

bundle install

bundle exec jekyll build --trace --profile --lsi

bundle exec jekyll serve --incremental --livereload


jekyll notes:

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