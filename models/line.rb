class Line
  include DataMapper::Resource

  property :id, Serial
  property :latitude, Integer
  property :longitude, Integer
  property :sequence_pos, Integer

  belongs_to :tour

end