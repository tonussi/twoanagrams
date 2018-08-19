# README

This tiny project was made just for a self taught experience on whats new with Rails, Ruby and Vuetify.

## Ruby version

- ruby: `2.3.1`

- rails: `~> 5.2.1`

## System dependencies

- Nodejs, Rails, Ruby, RVM (recommended), Visual Code (or other), Byebug, Vuejs Dev Plugin for Browser.

## Configuration

`rails new <appname> --skip-turbolinks --webpack=vue`

Turbolinks (https://github.com/turbolinks/turbolinks) "Turbolinks® makes navigating your web application faster."
Although I'm not using it, Turbolinks works properly with Rails and Vuejs together.

Turbolinks,

- "Optimizes navigation automatically."
- "No server-side cooperation necessary."
- "Respects the web."
- "Supports mobile apps."

## Database creation

`heroku addons:create heroku-postgresql:hobby-dev`

This config var with a "color" sufixe can be spotted at `heroku config`. I think heroku automatically promotes the database to your app. Nonetheless, you should promote it.

`heroku pg:promote HEROKU_POSTGRESQL_<COLOR>`

## Database initialization

I'm using postgresql addon at heroku. 

`heroku run:detached rake --app twoanagrams db:migrate`

Then something like that will appear in the console:

`heroku logs --app twoanagrams --dyno run.<#####>`

Its another command, useful for checking what is happening with the previous process you ran as detached.

## How to run the test suite

`rails test -b test/models/anagram_test.rb`

## Services (job queues, cache servers, search engines, etc.)

None.

## Deployment instructions

Rails automatically creates a project that runs at heroku, you only have to change `config/puma.rb` and `config/database.rb`:

### puma.rb

``` rb
workers Integer(ENV['WEB_CONCURRENCY'] || 2)
threads_count = Integer(ENV['RAILS_MAX_THREADS'] || 5)
threads threads_count, threads_count

preload_app!

rackup      DefaultRackup
port        ENV['PORT']     || 3000
environment ENV['RACK_ENV'] || 'development'

on_worker_boot do
  # Worker specific setup for Rails 4.1+
  # See: https://devcenter.heroku.com/articles/deploying-rails-applications-with-the-puma-web-server#on-worker-boot
  ActiveRecord::Base.establish_connection
end
```
### database.rb

``` rb
default: &default
  adapter: postgresql
  encoding: unicode
  pool: <%= ENV.fetch("RAILS_MAX_THREADS") { 5 } %>

development: &development
  <<: *default
  database: twoanagrams_dev
  username: postgres
  password: postgres
  host: localhost

test:
  <<: *development
  database: twoanagrams_test

production:
  url: <%= ENV['DATABASE_URL'] %>
```

## To deploy into heroku you need just to do:

`git push heroku master`
