module Post
  module Settings

    def self.registered(app)
      app.post '/settings' do
        user = User.get(session[:user_id])
        user.update_settings(params)
      end
    end

  end
end
