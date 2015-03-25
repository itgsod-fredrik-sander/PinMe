class Seed
  def self.seed
    tours
    pins
    settings
    users
    savedtours
    colors
    tags
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
        { zoom_level: 3, user_id: 1, color_id:1 },
        { zoom_level: 3, user_id: 2, color_id:2 },
        { zoom_level: 1 , user_id: 3, color_id:3 },
        { zoom_level: 2, user_id: 4, color_id:2 }
    ]

    settings.each { |setting| Setting.create(setting) }
  end

  def self.tours
    tours = [
        { user_id: 4, name: "PeX tour of Stocholm", description: "A tour of the city of Stockholm", rating: 2.5 },
        { user_id: 5, name: "Organized tour of SharpFruits", description: "Best tour ever", rating: 4.5 },
        { user_id: 5, name: "Lindas amazing tour", description: "A tour of Paris", rating: 1.5 },
        { user_id: 1, name: "Chugchug with JD&MK", description: "Beer run in Japan", rating: 2.5 },
        { user_id: 4, name: "Tour of New york with a proffesional guide", description: "New york is a city...", rating: 2.5 },
        { user_id: 5, name: "A tour of my small city!", description: "My city is located outside of Madrid.", rating: 4.5 },
        { user_id: 5, name: "Mits tour of Sexstores in Stockholm", description: "I know all the sexstores and I will show you the best ones.", rating: 1.5 },
        { user_id: 1, name: "Tour of London", description: "Best tour when you want to take a walk", rating: 2.5 },
        { user_id: 4, name: "Freds nerd tour of LA", description: "Perfect when you want to find nerdy things in LA", rating: 2.5 },
        { user_id: 5, name: "Andres tour of trolling", description: "Go this tour and prank your friends.", rating: 4.5 },
        { user_id: 5, name: "Magic tour", description: "A tour that revolves around magic, preformers and stores all in one tour.", rating: 1.5 },
        { user_id: 1, name: "Pedros tour of cat café", description: "Cat café in Japan", rating: 2.5 },
        { user_id: 4, name: "Island hopping in Philippines", description: "A tour of infamous islands of the Philippines", rating: 2.5 },
        { user_id: 5, name: "Greek Myths tour", description: "A tour of Greek myths", rating: 4.5 },
        { user_id: 5, name: "Pizza tour", description: "Pizzas in Italy is the best and these are the best pizza places in Italy", rating: 1.5 },
        { user_id: 1, name: "Beijing hidden beauty", description: "Beijing has a few secrets let me show you!", rating: 2.5 },

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
        { user_id: 1, tour_id: 1 },
        { user_id: 2, tour_id: 2 },
        { user_id: 2, tour_id: 3 },
        { user_id: 3, tour_id: 3 }
    ]

    savedtours.each { |savedtour| Savedtour.create(savedtour) }
  end

  def self.colors
    colors = [
        { name: "Blue", hex: "#0000FF" },
        { name: "Red", hex: "#FF0000" },
        { name: "Green", hex: "#008000" }
    ]
    colors.each { |color| Color.create(color) }
  end

  def self.tags
    tags = [
        {name: "USA", tour_id: 1},
        {name: "Japan", tour_id: 1},
        {name: "Coolest", tour_id: 1},
        {name: "Sweden", tour_id: 2},
        {name: "Healthy", tour_id: 2},
        {name: "Natural", tour_id: 2},
        {name: "Stockholm", tour_id: 3},
        {name: "Experience", tour_id: 3},
        {name: "Extreme", tour_id: 3},
        {name: "Pex", tour_id: 4},
        {name: "Food", tour_id: 4},
        {name: "Secret", tour_id: 4},
        {name: "First", tour_id: 5},
        {name: "Music", tour_id: 5},
        {name: "Nerd", tour_id: 5},
        {name: "Fashion", tour_id: 6},

        {name: "Imposement", tour_id: 6},
        {name: "Inspectress", tour_id: 6},
        {name: "Nineteenth", tour_id: 7},
        {name: "Blocked", tour_id: 7},
        {name: "Artful", tour_id: 7},
        {name: "Pease", tour_id: 8},
        {name: "Alabastrum", tour_id: 8},
        {name: "Hedgehog", tour_id: 8},
        {name: "Totem", tour_id: 9},
        {name: "Swede", tour_id: 9},
        {name: "Immediately", tour_id: 9},
        {name: "Sea", tour_id: 10},
        {name: "Seafood", tour_id: 10},
        {name: "Dance", tour_id: 10},
        {name: "Training", tour_id: 11},
        {name: "Clothing", tour_id: 11},

        {name: "Street", tour_id: 11},
        {name: "Shoes", tour_id: 12},
        {name: "Forest", tour_id: 12},
        {name: "City", tour_id: 13},
        {name: "Long", tour_id: 13},
        {name: "Short", tour_id: 13},
        {name: "Game", tour_id: 14},
        {name: "Hard", tour_id: 14},
        {name: "Easy", tour_id: 14},
        {name: "Nighttime", tour_id: 15},
        {name: "Daytime", tour_id: 15},
        {name: "Cheap", tour_id: 15},
        {name: "Expensive", tour_id: 16},
        {name: "Hipster", tour_id: 16},
        {name: "Sports", tour_id: 16},


    ]
    tags.each {|tag| Tag.create(tag)}
  end

end
