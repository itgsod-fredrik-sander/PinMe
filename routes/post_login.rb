module Post
  module Login

    def self.registered(app)
      app.post '/login' do 
        if User.authenticate(params['username'], params['password'])
          session[:user_id] = User.first(:username => params['username']).id
          redirect '/home'
        end
      end
    end
  end 
end