module Get
  module Findtour

    def self.registered(app)
        app.get '/findtour/:sidenumber' do |sidenumber|
        @sidenumber = sidenumber
        @user = User.get(1)
        #@user = User.get(session[:user_id])
        @tours = Tour.all
        slim :findtour
      end
    end
  end
end