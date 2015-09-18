require 'rps'

describe RPS do

  it 'generates a computer responce' do
    allow(RPS).to receive(:computer_move).and_return('rock')
    computer_move = RPS.computer_move
    expect(computer_move).to eq 'rock'
  end

  describe 'declares computer a looser' do
    it 'if player = rock & computer = scissors' do
      allow(RPS).to receive(:computer_move).and_return('scissors')
      result = RPS.play('rock')
      expect(result[:message]).to eq 'computer lost'
    end

    it 'if player = paper & computer = rock' do
      allow(RPS).to receive(:computer_move).and_return('rock')
      result = RPS.play('paper')
      expect(result[:message]).to eq 'computer lost'
    end

    it 'if player = scissors & computer = paper' do
      allow(RPS).to receive(:computer_move).and_return('paper')
      result = RPS.play('scissors')
      expect(result[:message]).to eq 'computer lost'
    end
  end

  describe 'declares a draw' do
    it 'if both player and computer make the same move' do
      allow(RPS).to receive(:computer_move).and_return('paper')
      result = RPS.play('paper')
      expect(result[:message]).to eq 'it\'s a draw'
    end
  end


  describe 'computer wins' do
    it 'if player = scissors & computer = rock' do
      allow(RPS).to receive(:computer_move).and_return('rock')
      result = RPS.play('scissors')
      expect(result[:message]).to eq 'you lost'
    end
  end

end