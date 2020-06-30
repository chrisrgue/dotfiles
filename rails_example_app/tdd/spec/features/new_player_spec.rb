
require 'rails_helper'

RSpec.describe "Page to create a new player" do
  it "displays the correct field to create a new player" do

    visit root_path
    click_link "New Player"

    expect(page).to have_field("First name")
    expect(page).to have_field("Last name")

  end

end
