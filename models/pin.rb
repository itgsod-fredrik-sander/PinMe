class Pin
  include DataMapper::Resource

  property :id, Serial
  property :sequencepos, Integer
  property :description, Text
  property :img_url, String
  property :longitude, Float
  property :latitude, Float

  belongs_to :tour
end