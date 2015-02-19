module Get
  module Settings

    def self.registered(app)
      app.get '/settings' do
      end
    end

  end
end