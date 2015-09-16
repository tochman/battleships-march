require 'spec_helper'

feature 'Starting a new game' do
  #   background do
  #   User.make(:name => 'Gustaf')
  # end


  scenario 'I am asked what my name is' do
    visit '/'
    click_button 'Play Now!'
    expect(page).to have_content "Enter your names, player 1 and player 2:"
  end

  scenario 'I am asked to pass in two names in a form and press submit' do
      visit '/new_game'
      fill_in 'name', :with => 'Chris'
      fill_in 'name2', :with => 'David'
      click_on 'submit'
      # byebug
      expect(page).to have_content "Chris"
      expect(page).to have_content "David"
  end

  #   scenario 'I need to put in a name to continue' do
  #     visit '/new_game'
  #     fill_in 'name', :with => nil
  #     click_on 'submit'
  #     # byebug
  #     expect(page).to have_content "What's your name"
  # end
end
