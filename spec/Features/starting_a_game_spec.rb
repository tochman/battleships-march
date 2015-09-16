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

  scenario "Enter 'Chris' and 'David' in the form and Submit" do
      visit '/new_game'
      fill_in 'name1', :with => 'Chris'
      fill_in 'name2', :with => 'David'
      click_on 'submit'
      # byebug
      expect(page).to have_content "Chris"
      expect(page).to have_content "David"
  end
end
