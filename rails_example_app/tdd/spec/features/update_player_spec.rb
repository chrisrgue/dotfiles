
require 'rails_helper'

RSpec.describe "Updating a player" do

  it "updates the player and redirects to the root page" do
    player = Player.create(first_name: "Eduardo", last_name: "Baik")
    visit root_path
    expect(page).to have_text("Eduardo")
    click_link "Edit Profile"
    fill_in "First name", with: "John"
    click_button "Update Player"
    expect(current_path).to eq(root_path)
    expect(page).not_to have_text("Eduardo")
    expect(page).to have_text("John")
  end

end


