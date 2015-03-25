module Get
  module Findtour

    def self.registered(app)
        app.get '/findtour/:sidenumber' do |sidenumber|
        @sidenumber = sidenumber.to_i
        @user = User.get(1)
        #@user = User.get(session[:user_id])
        @tours = Tour.all[12 * @sidenumber...12 + (@sidenumber * 12)]
        slim :findtour
      end
    end
  end
end