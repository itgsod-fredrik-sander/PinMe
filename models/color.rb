class Color
  include DataMapper::Resource

  property :id, Serial
  property :color_name, String
  property :color_hex, String

  belongs_to :setting
end