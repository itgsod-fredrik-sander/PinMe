class User
  include DataMapper::Resource

  property :id, Serial
  property :first_name, String
  property :last_name, String
  property :username, String, :unique => true
  property :password, BCryptHash
  property :email, String, :unique => true
  property :premium, Boolean
  property :profile_picture, String

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

  def self.change_email(user_id, password, new_email, current_email)
    puts user_id
    user = User.get(user_id.to_i)
    if user.password == password
      if user.email == current_email
        user.email = new_email
      end
    end
  end

  def self.change_password(user_id, current_password, new_password, confirm_password)
    user = User.get(user_id.to_i)
    if user.password == current_password && confirm_password == new_password
      user.password = new_password
    end
  end

  def self.set_zoom_level(user_id, zoom_level)
    zoom_level = zoom_level.to_i
    if zoom_level > 0 && zoom_level < 5
      user = User.get(user_id.to_i)
      user.setting.zoom_level = zoom_level
    end
  end

  def self.set_color(user_id, color)
    if Color.first(color_name: color)
      user= User.get(user_id.to_i)
      user.setting.color = color
    end
  end


end

