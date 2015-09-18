feature 'RPS game' do


  scenario 'computer wins' do
    visit '/rps'
    allow(RPS).to receive(:computer_move).and_return('rock')
    select 'Scissors', from: 'move'
    #fill_in 'move', with: 'scissors'
    find('input[value="Play"]').click
    expect(page).to have_content 'you lost'

  end

  scenario 'computer looses' do
    visit '/rps'
    allow(RPS).to receive(:computer_move).and_return('paper')
    select 'Scissors', from: 'move'
    find('input[value="Play"]').click
    expect(page).to have_content 'computer lost'
  end

  scenario 'it is a draw' do
    visit '/rps'
    allow(RPS).to receive(:computer_move).and_return('paper')
    select 'Paper', from: 'move'
    find('input[value="Play"]').click
    expect(page).to have_content 'it\'s a draw'
  end


end