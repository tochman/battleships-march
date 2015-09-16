require 'sinatra/base'



class BattleshipsWeb < Sinatra::Base
  set :views, proc {File.join(root, '..', 'views')}
  enable :sessions

  get '/' do
    @player1 = params[:name]
    @player2 = params[:name2]
    erb :index
  end

  get '/new_game' do
  @player1 = params[:name]
  @player2 = params[:name2]
  erb :new_game
  end

  post '/new_game' do
    "Hello!"
    @player1 = params[:name]
    @player2 = params[:name2]
    session[:name] = params[:name]
    session[:name2] = params[:name2]
    erb :new_game
  end

  get '/settings' do
    @player_name = session[:name]
    @player2_name = session[:name2]
    erb :settings
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
