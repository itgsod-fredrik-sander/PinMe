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

    before do
      @size = User.all.size
    end

    it 'should not create an user with the same name' do
      User.create(username: 'frellen')
      User.all.size.should eq @size
    end

    it 'should not allow creations of usernames with less than 3 chars' do
      User.create(username: 'fr')
      User.all.size.should eq @size
    end

  end

end
