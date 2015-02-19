class User
  include DataMapper::Resource

  property :id, Serial
  property :first_name, String
  property :last_name, String
  property :username, String, :unique => true
  property :password, BCryptHash
  property :email, String, :unique => true
  property :premium, Boolean

  validates_length_of :username, :within => 3...30

  has 1, :setting
  has n, :tours
  has n, :savedtours
  has n, :tours, :through => :savedtours

  def name
    @first_name + ' ' + @last_name
  end

  def self.authenticate(username, password)
    user = User.first(:username => username)
    user && user.password == password
  end
end

