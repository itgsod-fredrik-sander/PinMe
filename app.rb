require_relative 'helper'

Dir['./routes/*.rb'].each {|file| require file}

class App < Sinatra::Base
  enable :sessions
  register Sinatra::Flash
  helpers Sinatra::App::Helpers

  get '/' do
    redirect '/login'
  end

  get '/home' do
    unless session[:user_id]
      flash[:error] = 'You must sign in'
      redirect '/login'
    end

    @user = User.get(session[:user_id])
    @colors = Color.all
    
    slim :home
  end

  get '/findtour/:sidenumber' do |sidenumber|
    @sidenumber = sidenumber.to_i
    @user = User.get(1)
    #@user = User.get(session[:user_id])
    @tours = Tour.all[12 * @sidenumber...12 + (@sidenumber * 12)]
    slim :findtour
  end

  get '/lines' do 
    if session[:tour_id] 
      Tour.get(session[:tour_id]).lines.sort_by {|l| l.sequence_pos}.to_json
    end
  end

  get '/login' do 
    @users_registered = User.all.size
    slim :login
  end

  get '/logout' do 
    session[:user_id] = nil
    redirect '/'
  end

  get '/tourdata' do 
    session[:tour_id] = params['id']
    tour = Tour.get(params['id'])
    tour.pins.to_json
  end

  post '/login' do
    if User.authenticate(params['username'], params['password'])
      session[:user_id] = User.first(username: params['username']).id
      redirect '/home'
    else
      flash[:error] = "Invalid account credentials, try again"
      redirect '/login'
    end
  end

  post '/new/clickedpoint' do
    tour_id = session[:tour_id]
    if tour_id
      sequence_pos = Tour.get(tour_id).lines.size
      Line.create(latitude: params['lat'], longitude: params['lng'], sequence_pos: sequence_pos, tour_id: tour_id, free_move: params['freeMove'])
    end 
  end

  post '/register' do
    user = User.create(first_name: params['firstname'], last_name: params['lastname'], username: params['username'], password: params['password'], email: params['email'], premium: false)

    if user.errors.empty?
      Setting.create(zoom_level: 4, user: user, color_id: 1)
      session[:user_id] = user.id
      redirect '/home'
    else
      flash[:error] = user.errors.values.flatten
      redirect '/login'
    end
  end

  post '/settings' do
    user = User.get(session[:user_id])
    user.update_settings(params)
  end
end