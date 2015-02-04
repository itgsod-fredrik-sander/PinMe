module Get
  module Tourdata

    def self.registered(app)
      app.get '/tourdata' do 
        session[:tour_id] = params['id']
        tour = Tour.get(params['id'])
        tour.pins.to_json
      end
    end

  end
end