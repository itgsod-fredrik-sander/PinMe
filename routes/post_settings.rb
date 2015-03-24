module Post
  module Settings

    def self.registered(app)
      app.post '/settings' do
        user_id = session[:user_id]
        current_password, new_password, confirm_password = params['current-password'], params['new-password'], params['confirm-password']
        current_email, new_email = params['current-email'], params['new-email']
        color, zoom_level = params['color'], params['zoom-level']


        User.change_email(user_id, current_email, new_email, current_password)
        User.change_password(user_id, current_password, new_password, confirm_password)
        User.set_zoom_level(user_id, zoom_level)
        User.set_color(user_id, color)
      end
    end

  end
end
