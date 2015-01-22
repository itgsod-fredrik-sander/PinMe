require_relative 'helper'

Dir['./routes/*.rb'].each {|file| require file}

class App < Sinatra::Base
  
  enable :sessions

  helpers Sinatra::App::Helpers

  register Get::Root
end