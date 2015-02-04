class Setting
  include DataMapper::Resource

  property :id, Serial #TODO: Should not have ID, fix later alligator
  property :zoom_level, Integer
  property :language, String

  belongs_to :user
end