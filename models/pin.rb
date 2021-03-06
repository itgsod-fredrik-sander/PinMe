class Pin
  include DataMapper::Resource

  property :id, Serial
  property :sequence_pos, Integer
  property :title, Text
  property :description, Text
  property :img_url, String
  property :longitude, Float
  property :latitude, Float

  belongs_to :tour
end