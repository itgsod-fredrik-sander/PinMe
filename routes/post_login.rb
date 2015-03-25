module Post
  module Login

    def self.registered(app)
      app.post '/login' do
        user = User.first(username:params['username'])
        flash[:error] = "test"
        if user.authenticate(params['password'])
          session[:user_id] = user.id
          redirect '/home'
        end
      end
    end
  end 
end