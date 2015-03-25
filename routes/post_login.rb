module Post
  module Login

    def self.registered(app)
      app.post '/login' do
        if User.authenticate(params['username'], params['password'])
          session[:user] = User.first(username: params['username'])
          redirect '/home'
        else
          flash[:error] = "Invalid account credentials, try again"
          redirect '/login'
        end
      end
    end
  end 
end