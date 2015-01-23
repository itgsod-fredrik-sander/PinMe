class User
  include DataMapper::Resource

  property :id, Serial
  property :username, String
  property :password, BCryptHash
  property :email, String
  property :premium, Boolean

  has 1, :setting
end