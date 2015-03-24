class Setting
  include DataMapper::Resource

  property :id, Serial #TODO: Should not have ID, fix later alligator
  property :zoom_level, Integer

  belongs_to :color
  belongs_to :user
end