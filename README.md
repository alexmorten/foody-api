# README
things to do in development to get going:
bundle install

rake db:create
rake db:migrate

bundle exec sidekiq
redis-server
(to clear redis db: 'redis-cli flushall' )
rails s
