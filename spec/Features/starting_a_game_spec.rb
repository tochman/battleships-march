require 'spec_helper'

feature 'Starting a new game' do
  scenario 'I am asked to enter a new game' do
    visit '/'
    click_link 'New Game'
    expect(page).to have_content "What's your name?"
  end
end
