require_relative 'models_helper'

describe User do

  before do
    @user = User.first(first_name: 'Refugio')
  end

  describe 'name convenience method' do

    it 'should return first and last names' do
      @user.name.should match 'Refugio Hertzog'
    end

  end

end