require 'rails_helper'

RSpec.describe "A visitor can see a projects show page" do
  it "shows the name, material, challenge theme and number of contestants" do
    challenge1 = Challenge.create!(theme: "Roses", project_budget: "5")

    project1 = Project.create!(name: "Ruffles", material: "Bows", challenge: challenge1)
    project2 = Project.create!(name: "flowers", material: "only real flowers", challenge: challenge1)

    contestant1 = Contestant.create!(name: "Harry", age: "45", hometown: "Somewhere unimpressive", years_of_experience: "3")
    contestant2 = Contestant.create!(name: "Sara", age: "63", hometown: "New York", years_of_experience: "6")
    contestant3 = Contestant.create!(name: "John", age: "34", hometown: "Baltimore", years_of_experience: "32")

    project1.contestants << contestant1
    project1.contestants << contestant2
    project1.contestants << contestant3
    project2.contestants << contestant2
    project2.contestants << contestant3

    visit "/projects/#{project1.id}"

    expect(page).to have_content("Ruffles")
    expect(page).to have_content("Material: Bows")
    expect(page).to have_content("Challenge Theme: Roses")
    expect(page).to have_content("Number of Contestants: 3")

    visit "/projects/#{project2.id}"

    expect(page).to have_content("flowers")
    expect(page).to have_content("Material: only real flowers")
    expect(page).to have_content("Challenge Theme: Roses")
    expect(page).to have_content("Number of Contestants: 2")
  end

  it "shows average years of experience for the contestants" do
    challenge1 = Challenge.create!(theme: "Roses", project_budget: "5")

    project1 = Project.create!(name: "Ruffles", material: "Bows", challenge: challenge1)
    project2 = Project.create!(name: "flowers", material: "only real flowers", challenge: challenge1)

    contestant1 = Contestant.create!(name: "Harry", age: "45", hometown: "Somewhere unimpressive", years_of_experience: "3")
    contestant2 = Contestant.create!(name: "Sara", age: "63", hometown: "New York", years_of_experience: "6")
    contestant3 = Contestant.create!(name: "John", age: "34", hometown: "Baltimore", years_of_experience: "32")

    project1.contestants << contestant1
    project1.contestants << contestant2
    project1.contestants << contestant3
    project2.contestants << contestant2
    project2.contestants << contestant3

    visit "/projects/#{project1.id}"

    expect(page).to have_content("Average Contestant Experience: 13.6 years")

    visit "/projects/#{project2.id}"

    expect(page).to have_content("Average Contestant Experience: 19.0 years")
  end
end
