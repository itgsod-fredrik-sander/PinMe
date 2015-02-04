class Line
  include DataMapper::Resource

  property :id, Serial
  property :latitude, Interger
  property :longitude, Integer
  property :sequence_pos, Integer

  belongs_to :tour

end