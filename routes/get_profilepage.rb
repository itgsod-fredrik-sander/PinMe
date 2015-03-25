module Get
  module Profilepage

    def self.registered(app)
      app.get '/profilepage' do
      @user = User.get(1)
      #@user = User.get(session[:user_id])
        slim :profilepage
      end
    end
  end
end