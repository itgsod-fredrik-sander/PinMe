require_relative 'helper'

Dir['./routes/*.rb'].each {|file| require file}

class App < Sinatra::Base
  
  enable :sessions

  helpers Sinatra::App::Helpers

  register Get::Root
  register Get::Home
  register Get::Settings
  register Get::Login

  register Get::Tourdata
  register Get::Lines

  register Post::New::Clickedpoint
  register Post::Login
end