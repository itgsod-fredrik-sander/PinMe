module Get
  module Root

    def self.registered(app)
      app.get '/' do
        slim :root
      end
    end

  end
end