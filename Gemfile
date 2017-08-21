source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem 'rails', '~> 5.1.2'
gem 'mysql2', '0.3.20'
gem 'puma', '~> 3.7'

group :development do
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :development, :test do
  gem 'rspec-rails'
  gem 'rails-controller-testing'
  gem 'factory_girl_rails'
  gem 'pry'
  gem 'pry-rails'
  gem 'capistrano'
  gem 'capistrano-rails'
  gem 'capistrano3-puma'
  gem 'capistrano-bundler'
  gem 'capistrano-rvm'
end
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
gem 'execjs'
gem 'therubyracer'
gem 'activeadmin'
gem 'devise',      '> 4.x'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 2.7.2'
gem 'jquery-rails'
