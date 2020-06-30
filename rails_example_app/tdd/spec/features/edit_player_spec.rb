
require 'rails_helper'

RSpec.describe "editing player" do

  before do
    @player = Player.create(first_name: "Eduardo", last_name: "Baik")
  end

  it "displays a form with the player values prepopulated" do
    visit root_path
    click_link "Edit Profile"
    expect(current_path).to eq("/players/#{@player.id}/edit")
    expect(page).to have_field("Last name")

    expect(find_field('First name').value).to eq("#{@player.first_name}")
    expect(find_field('Last name').value).to eq("#{@player.last_name}")
  end

end

