module Post
  module Register

    def self.registered(app)
      app.post '/register' do
        user_data = { first_name: params['firstname'], last_name: params['lastname'],
                      username: params['username'], password: params['password'],
                      email: params['email']}

        registration_status = true

        # Check if there exists a user with the same username as in the form
        if User.first(username: params['username'])
          flash[:error] = 'Username already taken, choose another one'
          registration_status = false 
        end

        # Check if there exists a user with the same email as in the form
        if User.first(email: params['email'])
          flash[:error] = 'Email already taken, choose another one'
          registration_status = false
        end

        #Check if the email contains a '@' character
        valid_email = false
        params['email'].split('').each {|char| valid_email = true if char == '@'}
        unless valid_email 
          flash[:error] = 'Invalid email, try again'
          registration_status = false
        end

        #Check if username is too short
        if params['username'].size < 3
          flash[:error] = 'Username too short'
          registration_status = false
        end

        if params['password'].size < 4
          flash[:error] = 'Password too short'
          registration_status = false
        end

        # Checks if any data is empty/nil
        valid_data = true
        user_data.each {|key, data| valid_data = false if data.nil? || data == false || data.empty?}
        unless valid_data
          flash[:error] = 'Verify your data and try again' 
          registration_status = false
        end

        if registration_status
          user_data.merge!(premium: false)
          user = User.create(user_data)

          settings_data = {zoom_level: 4, user: user, color_id: 1}
          Setting.create(settings_data)

          session[:user] = User.first(username: user.username)
          redirect '/home'
        else
          redirect '/login'
        end
      end
    end

  end
end