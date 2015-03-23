module Get
  module Home

    def self.registered(app)
      app.get '/home' do 
        @user = User.get(session[:user_id])
        slim :home
      end
    end

  end
end