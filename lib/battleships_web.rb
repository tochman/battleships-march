require './lib/player.rb'
require 'sinatra/base'
require 'byebug'



class BattleshipsWeb < Sinatra::Base
  set :views, proc {File.join(root, '..', 'views')}
  enable :sessions

  get '/' do
    @name1 = params[:name1]
    @name2 = params[:name2]
    erb :index
  end

  get '/new_game' do
  @name1 = params[:name1]
  @name2 = params[:name2]
  erb :new_game
  end

  post '/new_game' do
    if params[:name1] == '' || params[:name2] == ''
      erb :new_game
    else
      @name1 = params[:name1]
      @name2 = params[:name2]
      p1 = Player.new(@name1)
      p2 = Player.new(@name2)
      session[:name1] = params[:name1]
      session[:name2] = params[:name2]
      session[:p1] = p1
      session[:p2] = p2
      erb :new_game
    end
  end

  get '/settings' do
    @player1_name = session[:name1]
    @player2_name = session[:name2]
    erb :settings
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
