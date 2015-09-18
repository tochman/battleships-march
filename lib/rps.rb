module RPS

  def self.computer_move
    %w(rock paper scissors).sample
  end

  def self.play(move)
    computer_move = self.computer_move
    player_move = move
    if player_move == 'rock' && computer_move == 'scissors' || player_move == 'scissors' && computer_move == 'paper' || player_move == 'paper' && computer_move == 'rock'
      message = 'computer lost'
    elsif player_move == computer_move
      message = 'it\'s a draw'
    else
      message = 'you lost'
    end
    {player: player_move, computer: computer_move, message: message }
  end
end