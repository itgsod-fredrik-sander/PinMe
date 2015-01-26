class Seed
  def self.seed
    tours
  end


  # def self.pins
  #   # pins = [{ sequencepos:
  #   #
  #   #         }]
  #
  # end
  #
  # def self.settings
  #
  # end

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
