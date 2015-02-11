class Line
  include DataMapper::Resource

  property :id, Serial
  property :latitude, Float
  property :longitude, Float
  property :sequence_pos, Integer
  property :free_move, Boolean

  belongs_to :tour

end