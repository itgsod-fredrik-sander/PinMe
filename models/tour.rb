class Tour
  include DataMapper::Resource

  property :id, Serial
  property :name, String
  property :description, Text
  property :rating, Float

  has n, :lines
  has n, :pins
  has n, :savedtours
  has n, :tags
  has n, :users, :through => :savedtours
  belongs_to :user

end