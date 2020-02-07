require 'rails_helper'

RSpec.describe "visitor sees projects name, material and the theme of the challenge in the project show page" do
  it "has a show page" do
    challenge1 = Challenge.create!(theme: "Roses", project_budget: "5")
    project1 = Project.create!(name: "Ruffles", material: "Bows", challenge: challenge1)

    visit "/projects"

    expect(page).to have_content("name: Ruffles")
    expect(page).to have_content("material: Bows")
    expect(page).to have_content("challenge theme: Roses")
  end
end
