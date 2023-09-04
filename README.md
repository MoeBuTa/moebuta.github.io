# moebuta.github.io

npm config set registry http://registry.npmjs.org/ --global

npm cache clear --force

npm install --verbose

bundle install

bundle exec jekyll build --trace --profile --lsi

bundle exec jekyll serve --incremental --livereload