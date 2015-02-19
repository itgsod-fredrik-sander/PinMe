module Post
  module Register

    def self.registered(app)
      app.post '/register' do
        user_data = { first_name: params['firstname'], last_name: params['lastname'],
                      username: params['username'], password: params['password'],
                      email: params['email'], premium: false }
        
        user = User.create(user_data)

        settings_data = {zoom_level: 4, language: "English", user: user}
        Setting.create(settings_data)

        session[:user_id] = user.id
        redirect '/home'
      end
    end

  end
end