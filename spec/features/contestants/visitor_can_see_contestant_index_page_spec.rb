require 'rails_helper'

RSpec.describe "visitor can see contestant index page with names and all projects they have worked on" do
  it "has an index page" do
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

    visit "/contestants"

    # within("#contestant-#{contestant1.id}") do
      expect(page).to have_content("Harry")
      expect(page).to have_content("projects: Ruffles")
    # end

    # within("#contestant-#{contestant2.id}") do
      expect(page).to have_content("Sara")
      expect(page).to have_content("projects: Ruffles flowers")
    # end

    # within("#contestant-#{contestant3.id}") do
      expect(page).to have_content("John")
      expect(page).to have_content("projects: Ruffles flowers")
    # end
  end
end
