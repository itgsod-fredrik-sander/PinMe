module Get
  module Login

    def self.registered(app)
      app.get '/login' do 
        @users_registered = User.all.size
        slim :login
      end
    end

  end
end