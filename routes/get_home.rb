module Get
  module Home

    def self.registered(app)
      app.get '/home' do 
        session[:user_id] = 1
        @user = User.get(session[:user_id])
        @colors = Color.all
        slim :home
      end
    end

  end
end