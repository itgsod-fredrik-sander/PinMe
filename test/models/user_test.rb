require_relative 'models_helper'

describe User do

  before do
    @user = User.first(first_name: 'Refugio')
  end

  describe 'name convenience method' do

    it 'should return first and last names' do
      expect( @user.name ).to match 'Refugio Hertzog'
    end

  end

  describe 'creating users' do

    it 'should not create an user with the same name' do
      size = User.all.size
      User.create(username: 'frellen')
      User.all.size.should eq size
    end

  end


end
