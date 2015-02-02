# Load all models
Dir["./models/*.rb"].each {|model| require model}


configure :development do
  puts "*******************"
  puts "* DEVELOPMENT ENV *"
  puts "*******************"


  # Enable logging to console
  DataMapper::Logger.new($stdout, :debug)

  DataMapper.setup(:default, "sqlite:///#{Dir.pwd}/db/db.sqlite")

  # Enable pretty printing of Slim-generated HTML
  Slim::Engine.set_options pretty: true, sort_attrs: false

  # Load the application
  require_relative '../app'
end


configure :test do

  DataMapper.setup(:default, "sqlite:///#{Dir.pwd}/db/dev-db.sqlite")

end


# Check all models and associations are ok
DataMapper.finalize