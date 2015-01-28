class Savedtour
  include DataMapper::Resource

  property :id, Serial

  belongs_to :user, :key => true
  belongs_to :tour, :key => true
end