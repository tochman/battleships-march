require 'spec_helper'

feature 'Starting a new game' do
  #   background do
  #   User.make(:name => 'Gustaf')
  # end


  scenario 'I am asked what my name is' do
    visit '/'
    click_link 'New Game'
    expect(page).to have_content "Whats your name?"
  end

  scenario 'I am asked to pass in my name in a form and press submit' do
      visit '/new_game'
      fill_in 'name', :with => 'Gustaf'
      click_on 'submit'
      expect(page).to have_content "Gustaf"
  end

    scenario 'I need to put in a name to continue' do
      visit '/new_game'
      fill_in 'name', :with => nil
      click_on 'submit'
      expect(page).to have_content "Whats your name?"
  end
end
