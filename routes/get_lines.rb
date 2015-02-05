module Get
  module Lines

    def self.registered(app) 
      app.get '/lines' do 
        if session[:tour_id] 
          Tour.get(session[:tour_id]).lines.to_json
        end
      end
    end

  end
end