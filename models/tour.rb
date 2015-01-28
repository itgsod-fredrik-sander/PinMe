class Tour
  include DataMapper::Resource

  property :id, Serial
  property :name, String
  property :description, Text
  property :rating, Float

  has n, :pins
  belongs_to :user
  has n, :savedtours
  has n, :users, :through => :savedtours
end