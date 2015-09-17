require 'spec_helper'

feature 'Game setup' do
  #   background do
  #   User.make(:name => 'Gustaf')
  # end


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
      fill_in 'name1', with: 'Chris'
      fill_in 'name2', with: 'David'
      click_on 'submit'
      expect(current_path).to eq '/new_game'
      expect(page).to have_content 'Chris'
      expect(page).to have_content 'David'
    end

    scenario 'render form after unsuccessful submit' do
      fill_in 'name1', with: ''
      fill_in 'name2', with: 'David'
      click_on 'submit'
      expect(current_path).to eq '/new_game'
      expect(page).to have_content 'Enter your names, player 1 and player 2:'
      expect(page).to_not have_content 'David'
    end

  end




end
