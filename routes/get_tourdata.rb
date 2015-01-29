module Get
  module Tourdata

    def self.registered(app)
      app.get '/tourdata' do 
        puts "YES BOX" + params['id'] 
      end
    end

  end
end