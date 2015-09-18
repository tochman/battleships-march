feature 'RPS game' do


  scenario 'computer wins' do
    visit '/rps'
    allow(RPS).to receive(:computer_move).and_return('rock')
    fill_in 'move', with: 'scissors'
    find('input[value="Play"]').click
    expect(page).to have_content 'you lost'

  end

  scenario 'computer looses' do
    visit '/rps'
    allow(RPS).to receive(:computer_move).and_return('paper')
    fill_in 'move', with: 'scissors'
    find('input[value="Play"]').click
    expect(page).to have_content 'computer lost'
  end

  scenario 'it is a draw' do
    visit '/rps'
    allow(RPS).to receive(:computer_move).and_return('paper')
    fill_in 'move', with: 'paper'
    find('input[value="Play"]').click
    expect(page).to have_content 'it\'s a draw'
  end


end