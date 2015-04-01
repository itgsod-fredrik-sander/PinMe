module Get
  module Home

    def self.registered(app)
      app.get '/home' do
        unless session[:user]
          flash[:error] = 'You must sign in'
          redirect '/login'
        end
        #@user = User.get(1)
        @user = session[:user]
        @colors = Color.all
        slim :home
      end
    end

  end
end