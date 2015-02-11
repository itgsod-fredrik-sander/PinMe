module Get
  module Home

    def self.registered(app)
      app.get '/home' do 
        slim :home
      end
    end

  end
end