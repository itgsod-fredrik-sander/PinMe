module Get
  module Login

    def self.registered(app)
      app.get '/login' do 
        slim :login
      end
    end

  end
end