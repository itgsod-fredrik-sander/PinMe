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
      expect(User.all.size).to eq @size
    end

    it 'should not allow creations of usernames with less than 3 chars' do
      User.create(username: 'fr')
      expect(User.all.size).to eq @size
    end

    it 'should not allow creations of usernames with more than 30 chars' do
      User.create(username: 'qwert_yuiop_åasdf_ghjkl_öäzxc_vbnm')
      expect(User.all.size).to eq @size
    end

    it 'should allow creations of usernames with 3 chars' do
      User.create(username: 'fre')
      expect(User.all.size).not_to eq @size
    end

    it 'should allow creations of usernames with 29 chars' do
      User.create(username: 'qwertyuiopåasdfghjklöäzxcvbnm')
      expect(User.all.size).not_to eq @size
    end

  end

  describe 'creating email' do

    before do
      @size = User.all.size
    end

    it 'should creations of emails that already exists' do
      User.create(email: 'test@idontevenknow.anymore')
      expect(User.all.size).to eq @size
    end

  end

end
