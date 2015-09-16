require 'sinatra/base'



class BattleshipsWeb < Sinatra::Base
  set :views, proc {File.join(root, '..', 'views')}
  enable :sessions

  get '/' do
    @player1 = params[:name]
    erb :index
  end

  get '/new_game' do
  @player1 = params[:name]
  erb :new_game
  end

  post '/new_game' do
    "Hello!"
    @player1 = params[:name]
    session[:name] = params[:name]
    erb :board
  end

  get '/settings' do
    @player_name = session[:name]
    erb :settings
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
