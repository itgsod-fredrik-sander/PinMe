module Get
  module Profilepage

    def self.registered(app)
      app.get '/profilepage' do
      @user = User.get(1)
        slim :profilepage
      end

    end


  end
end