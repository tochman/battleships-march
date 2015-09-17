require 'spec_helper'

def form_submit(name1, name2)
  fill_in 'name1', with: name1
  fill_in 'name2', with: name2
  click_on 'submit'
end

feature 'Game setup' do

  feature 'Start view' do

    background do
      visit '/'
    end

    scenario 'welcomes player' do
      expect(page).to have_content 'Welcome to the Battleship game!'
    end

    scenario 'routes to /new_game' do
      click_button 'Play Now!'
      expect(current_path).to eq '/new_game'
    end
  end

  feature 'players setup' do
    background do
      visit '/new_game'
    end
    scenario 'asks for player names' do
      expect(page).to have_content 'Enter your names, player 1 and player 2:'
    end

    scenario 'render players name after successful submit' do
      form_submit('Chris', 'David')
      expect(current_path).to eq '/new_game'
      expect(page).to have_content 'Chris'
      expect(page).to have_content 'David'
    end

    scenario 'render form after unsuccessful submit' do
      form_submit('', 'David')
      expect(current_path).to eq '/new_game'
      expect(page).to have_content 'Enter your names, player 1 and player 2:'
      expect(page).to_not have_content 'David'
    end

  end




end
