require 'rails_helper'

RSpec.describe "player profile page" do
  before do
    @player = Player.create(first_name: "Eduardo", last_name: "Baik")
  end

  it "displays the information about the user" do
    visit root_path
    click_link "Show Profile"
    expect(current_path).to eq("/players/#{@player.id}")
    expect(page).to have_text("#{@player.first_name}")
    expect(page).to have_text("#{@player.last_name}")

  end

end

