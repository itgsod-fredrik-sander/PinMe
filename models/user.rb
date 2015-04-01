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

  def update_settings(params) 
    change_email(params['current-password'], params['current-email'], params['new-email'])
    change_password(params['current-password'], params['new-password'], params['confirm-password'])
    change_zoomlevel(params['zoom-level'])
    change_color(params['color'])
  end

  def self.authenticate(username, password)
    user = User.first(:username => username)
    user && user.password == password
  end

  private
  def change_email(password, current_email, new_email)
    if self.password == password && self.email == current_email
      self.update(email: new_email)
    end
  end

  def change_password(current_password, new_password, confirm_password)
    if self.password == current_password && confirm_password == new_password
      self.update(password: new_password)
    end
  end

  def change_zoomlevel(zoom_level)
    zoom_level = zoom_level.to_i
    if zoom_level > 0 && zoom_level < 5
      self.setting.update(zoom_level: zoom_level)
    end
  end

  def change_color(color_id)
    if Color.first(id: color_id)
      self.setting.update(color_id: color_id)
    end
  end
end

