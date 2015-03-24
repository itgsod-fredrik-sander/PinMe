class Color
  include DataMapper::Resource

  property :id, Serial
  property :name, String
  property :hex, String

  has n, :settings
end