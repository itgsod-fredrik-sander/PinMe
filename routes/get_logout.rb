# nr 77 issue

module Get
  module Logout

    def self.registered(app)
      app.get '/logout' do 
        session[:user_id] = nil
        redirect '/'
      end
    end

  end
end