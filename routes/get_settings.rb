module Get
  module Settings

    def self.registered(app)
      app.get '/settings' do
        slim :settings
      end
    end

  end
end