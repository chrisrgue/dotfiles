
require 'rails_helper'

RSpec.describe "Create a new player" do
  before do
    visit players_new_path
  end

  it "creates a new player if the validation passes" do
    fill_in 'First name', with: 'Lance'
    fill_in 'Last name', with: 'Robertson'
    click_button 'Create Player'
    expect(current_path).to eq(root_path)  # expect redirect to root page
  end

  it "does not create a new player if the validation fails" do
    click_button 'Create Player'  # try to submit an 'empty' player (presence validation should fail)
    expect(current_path).to eq(players_new_path)  # expect redirect to where we came from
    expect(page).to have_text("First name can't be blank")
    expect(page).to have_text("Last name can't be blank")
  end

end
