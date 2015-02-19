class Seed
  def self.seed
    tours
    pins
    settings
    users
    savedtours
  end


  def self.pins
    pins = [
        { sequence_pos: 0, description: "Pin number one is a fine pun", title: 'Pin one', img_url: "smexy.png", longitude: 12.3, latitude: 33.3, tour_id: 1 },
        { sequence_pos: 1, description: "Pin number two is a fine pun",  title: 'Pin two', img_url: "lexicon.png", longitude: 24.3, latitude: 45.3, tour_id: 1 },
        { sequence_pos: 2, description: "Pin number three is a fine pun", title: 'Pin three', img_url: "lyxfisk.png", longitude: 36.3, latitude: 57.3, tour_id: 1 },
        { sequence_pos: 3, description: "Pin number four is a fine pun", title: 'Pin four', img_url: "tacobiff.png", longitude: 58.3, latitude: 69.3, tour_id: 1 },

        { sequence_pos: 0, description: "Pin number one is a fine pun", title: 'Pin two one', img_url: "smexy.png", longitude: 30.3, latitude: 45.3, tour_id: 2 },
        { sequence_pos: 1, description: "Pin number two is a fine pun", title: 'Pin two two', img_url: "lexicon.png", longitude: 30.3, latitude: 15.3, tour_id: 2 },
        { sequence_pos: 2, description: "Pin number three is a fine pun", title: 'Pin two three', img_url: "lyxfisk.png", longitude: 30.3, latitude: 20.3, tour_id: 2 },
        { sequence_pos: 3, description: "Pin number four is a fine pun", title: 'Pin two four', img_url: "tacobiff.png", longitude: 30.3, latitude: 10.3, tour_id: 2 }
    ]

    pins.each {|pin| Pin.create(pin)}
  end

  def self.settings
    settings = [
        {zoom_level: 6, language: "English", user_id: 1 },
        {zoom_level: 3, language: "English", user_id: 2 },
        {zoom_level: 5, language: "English", user_id: 3 },
        {zoom_level: 2, language: "English", user_id: 4 }
    ]

    settings.each {|setting| Setting.create(setting)}
  end

  def self.tours
    tours = [
        { user_id: 4, name: "Rtour1", description: "stockholm.tour", rating: 2.5 },
        { user_id: 5, name: "Rtour2", description: "best tour ever", rating: 4.5 },
        { user_id: 5, name: "Rtour3", description: "lindas beutiful tour", rating: 1.5 },
        { user_id: 1, name: "Rtour4", description: "beer run in japan", rating: 2.5 }
    ]

    tours.each { |tour| Tour.create(tour) }
  end

   def self.users
    users = [
        { first_name: "Refugio", last_name: "Hertzog", username: "test",
          password:"test1", email: "test@test.test", premium: true, profile_picture: "jdksfn.png" },
        { first_name: "Pontus", last_name: "Lindgren", username: "pontus.lindgren",
          password:"test1", email: "test@testium.test", premium: true, profile_picture: "fjdskfnsk.png" },
        { first_name: "Lukas", last_name: "Ahlgren", username: "lukasahl",
          password:"test12", email: "test@testimum.test", premium: false, profile_picture:"mklknsjd.png" },
        { first_name: "Fredrik", last_name: "Lenton", username: "frellen",
          password:"test123", email: "test@testiumim.test", premium: true, profile_picture:"jdbhsbdv.png" },
        { first_name: "Isobel", last_name: "Storch", username: "boytoy",
          password:"test1234", email: "test@idontevenknow.anymore", premium: false, profile_picture:"bubdjsb.png" }
    ]

    users.each { |user| User.create(user) }
   end

  def self.savedtours
    savedtours = [
        {user_id: 1,tour_id: 1 },
        {user_id: 2,tour_id: 2 },
        {user_id: 2,tour_id: 3 },
        {user_id: 3,tour_id: 3 }
    ]

    savedtours.each { |savedtour| Savedtour.create(savedtour) }
  end

end
