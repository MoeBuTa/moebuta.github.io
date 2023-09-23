source "https://rubygems.org"

# Hello! This is where you manage which Jekyll version is used to run.
# When you want to use a different version, change it below, save the
# file and run `bundle install`. Run Jekyll with `bundle exec`, like so:
#
#     bundle exec jekyll serve
#
# This will help ensure the proper Jekyll version is running.
# Happy Jekylling!

# gem "github-pages", group: :jekyll_plugins

# To upgrade, run `bundle update`.

gem "jekyll", '~> 4.3', '>= 4.3.1'
gem "minimal-mistakes-jekyll", '>= 4.24.0'

gem "kramdown", '>= 2.3.0'
gem "liquid-c", '~> 4.0'
gem "rouge", '~> 4.0'

gem 'wdm', '>= 0.1.0'

# gem "mimemagic"

# Required for LSI, too slow however
if ENV['LSI'] == 'true'
  gem "classifier-reborn"

  if Gem::Version.new(RUBY_VERSION) >= Gem::Version.new('3.0.0')
    gem 'gsl', git: 'https://github.com/SciRuby/rb-gsl.git', ref: '103a3e1'
  else
    gem 'gsl'
  end
end

# The following plugins are automatically loaded by the theme-gem:
#   gem "jekyll-paginate"
#   gem "jekyll-sitemap"
#   gem "jekyll-gist"
#   gem "jekyll-feed"
#   gem "jekyll-include-cache"
#
# If you have any other plugins, put them here!
# Cf. https://jekyllrb.com/docs/plugins/installation/


group :jekyll_plugins do
  # Class 1: Default plugins on GitHub Pages
  #gem "jekyll-gist"
  gem "jekyll-sitemap"
  #gem "jekyll-paginate"
  gem "jekyll-feed"
  #gem "jemoji"
  gem "jekyll-relative-links"
  gem "jekyll-optional-front-matter"
  #gem "jekyll-readme-index"
  #gem "jekyll-default-layout"
  #gem "jekyll-titles-from-headings"
  gem "jekyll-github-metadata" if ENV['CI'] == 'true'

  # Class 2: Optional plugins on GitHub Pages
  gem "jekyll-redirect-from"
  gem "jekyll-mentions"
  gem "jekyll-seo-tag"
  #gem "jekyll-coffeescript"
  gem "jekyll-include-cache"

  # Class 3: Extras
  gem "jekyll-environment-variables"
  gem "jekyll-data"
  gem "jekyll-tidy"
  gem "jekyll-last-modified", '>= 1.0.3'
  #gem "jekyll-assets"
  gem "jekyll-algolia"
  gem "jekyll-archives", '>= 2.2.1'
  gem "jekyll-paginate-v2", '>= 3.0.0'
end
