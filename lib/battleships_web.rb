require './lib/player.rb'
require './lib/board'

require './lib/cell'
require './lib/ship'
require './lib/rps'
require 'sinatra/base'
require 'byebug'


class BattleshipsWeb < Sinatra::Base

  set :views, proc {File.join(root, '..', 'views')}
  enable :sessions
  set :session_secret, '123454321'
  use Rack::Session::Pool

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
    elsif params[:name1] != '' || params[:name2] != ''
      @name1 = params[:name1]
      @name2 = params[:name2]
      p1 = setup_player(params[:name1])
      p2 = setup_player(params[:name1])
      session[:p1] = p1
      session[:p2] = p2
      @html_board_p1 = p1.board.table_builder
      @html_board_p2 = p1.board.table_builder
      erb :new_game
    end
  end

  post '/place_ships' do
    #byebug
    #{"place_ship"=>{"ship_name"=>"A", "coord"=>"a1", "direction"=>"right"}}
    settings = params[:place_ship]
    ship = Ship.new(size: settings[:ship_size])
    byebug
    p1 = session[:p1]
    p1.board.place(ship, settings[:coord])
    erb :new_game
  end

  get '/settings' do
    @player1_name = session[:name1]
    @player2_name = session[:name2]
    erb :settings
  end

  get '/rps' do
    erb :rps
  end

  post '/rps' do
    @result = RPS.play(params[:move])
    erb :rps
  end

  def setup_player(name)
    player = Player.new(name)
    player.board = Board.new({size: 100, cell: Cell, number_of_pieces: 5})
    player
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
