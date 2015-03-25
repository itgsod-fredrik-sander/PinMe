module Get
  module Root

    def self.registered(app)
      app.get '/' do
        redirect '/login'
      end
    end

  end
end