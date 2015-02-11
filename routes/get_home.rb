module Get
  module Home

    def self.registered(app)
      app.get '/home' do 
        'home'
      end
    end

  end
end