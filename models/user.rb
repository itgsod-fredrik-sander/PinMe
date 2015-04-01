class User
  include DataMapper::Resource

  property :id, Serial
  property :first_name, String, :required => true
  property :last_name, String, :required => true
  property :username, String, :unique => true
  property :password, BCryptHash, :required => true
  property :email, String, :unique => true, :required => true
  property :premium, Boolean
  property :profile_picture, String

  validates_length_of :username, :within => 3...30, :message => 'Username must be between 3-30 characters'
  validates_length_of :password, :min => 3, :message => 'Password must be 3 characters or longer'
  validates_format_of :email, :as => :email_address, :message => 'Not a email'

  has 1, :setting
  has n, :tours
  has n, :savedtours
  has n, :tours, :through => :savedtours

  def name
    @first_name + ' ' + @last_name
  end

  def update_settings(params) 
    change_email(params)
    change_password(params['new-password'])
    change_zoomlevel(params['zoom-level'])
    change_color(params['color'])
  end

  def self.authenticate(username, password)
    user = User.first(:username => username)
    user && user.password == password
  end

  private
  def change_email(params)
    if self.email == params['current-email'] && self.password == params['current-password']
      self.update(email: params['new_email'])
    end
  end

  def change_password(new_password)
    if self.password == params['current-password']
      self.update(password: params['new_password'])
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

