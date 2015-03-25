module Get
  module Home

    def self.registered(app)
      app.get '/home' do 
        @user = session[:user]
        @colors = Color.all
        slim :home
      end
    end

  end
end