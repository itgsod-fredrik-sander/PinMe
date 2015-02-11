module Get
  module Lines

    def self.registered(app) 
      app.get '/lines' do 
        if session[:tour_id] 
          Tour.get(session[:tour_id]).lines.sort_by {|l| l.sequence_pos}.to_json
        end
      end
    end

  end
end