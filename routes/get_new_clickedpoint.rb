module Post
  module New
    module Clickedpoint

      def self.registered(app)
        app.post '/new/clickedpoint' do
          # If the user has entered a tour ID
          tour_id = session[:tour_id]
          if tour_id
            sequence_pos = Tour.get(tour_id).lines.size
            Line.create(latitude: params['lat'], longitude: params['lng'], 
                        sequence_pos: sequence_pos, tour_id: tour_id)
          end 
        end
      end

    end
  end
end