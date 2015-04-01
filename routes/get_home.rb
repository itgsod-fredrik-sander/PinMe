module Get
  module Home

    def self.registered(app)
      app.get '/home' do
        unless session[:user_id]
          flash[:error] = 'You must sign in'
          redirect '/login'
        end

        @user = User.get(session[:user_id])
        @colors = Color.all
        
        slim :home
      end
    end

  end
end