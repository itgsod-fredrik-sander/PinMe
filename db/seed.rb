class Seed
  def self.seed
    tours
    pins
  end


  def self.pins

    pins = [
        { sequencepos: 0, description: "Pin number one is a fine pun", img_url: "smexy.png", x: 12.3, y: 21.3 },
        { sequencepos: 1, description: "Pin number two is a fine pun", img_url: "lexicon.png", x: 12.3, y: 21.3 },
        { sequencepos: 2, description: "Pin number three is a fine pun", img_url: "lyxfisk.png", x: 12.3, y: 21.3 },
        { sequencepos: 3, description: "Pin number four is a fine pun", img_url: "tacobiff.png", x: 12.3, y: 21.3 },
    ]
    pins.each {|pin| Pin.create(pin)}

  end

  def self.settings



  end

  def self.tours
    tours = [
        { name: "Rtour1", description: "1 swag 4 pontus", rating: 2.5},
        { name: "Rtour2", description: "2 swag 4 pontus", rating: 4.5},
        { name: "Rtour3", description: "3 swag 4 pontus", rating: 1.5},
        { name: "Rtour4", description: "4 swag 4 pontus", rating: 2.5}
    ]
    tours.each {|tour| Tour.create(tour)}

  end

  # def self.users
  #
  # end

end
