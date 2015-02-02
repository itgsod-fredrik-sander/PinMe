class User
  include DataMapper::Resource

  property :id, Serial
  property :first_name, String
  property :last_name, String
  property :username, String, :unique => true
  property :password, BCryptHash
  property :email, String
  property :premium, Boolean

  has 1, :setting
  has n, :tours
  has n, :savedtours
  has n, :tours, :through => :savedtours

  def name
    @first_name + ' ' + @last_name
  end
end

