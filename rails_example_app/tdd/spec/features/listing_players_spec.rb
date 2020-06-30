require 'rails_helper'

RSpec.describe "List players" do
  it "displays the first name and last name from the players saved" do
    player1 = Player.create(first_name: "Eduardo", last_name: "Baik")
    player2 = Player.create(first_name: "Christopher", last_name: "Burns")

    visit root_path

    expect(page).to have_text("Eduardo")
    expect(page).to have_text("Baik")
    expect(page).to have_text("Christopher")
    expect(page).to have_text("Burns")

    expect(page).to have_link("New Player")

  end

end
