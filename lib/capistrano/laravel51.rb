require "capistrano/composer"
require "capistrano/file-permissions"
require "capistrano/laravel51/laravel"
require "capistrano/laravel51/migrations"

namespace :load do
  task :defaults do
    load 'capistrano/laravel51/defaults.rb'
  end
end
