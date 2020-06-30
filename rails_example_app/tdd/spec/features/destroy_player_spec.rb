
require 'rails_helper'

RSpec.describe "Destroy a player" do
  it "destroys a player correctly and redirects to the root path" do
    player = Player.create(first_name: "Eduardo", last_name: "Baik")
    visit root_path
    click_link "Delete Profile"
    expect(current_path).to eq(root_path)
    expect(page).not_to have_text("Eduardo")
  end

end

