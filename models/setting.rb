class Setting
  include DataMapper::Resource

  property :zoomlevel, Integer
  property :language, String

  belongs_to :user
end