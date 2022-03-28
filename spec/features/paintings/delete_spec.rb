require 'rails_helper'

RSpec.describe 'destroy an artist and their paintings' do
  it 'can delete artists and their painting from show page' do
    artist = Artist.create!(name: "Picasso", birth_year: 1881, living: false)
    painting_3 = artist.paintings.create!(name: "Guernica", year_finished: 1937, abstract: true)
    visit "/paintings"
    expect(page).to have_content("Guernica")


    click_button "Delete"
    expect(current_path).to eq("/paintings")
    expect(page).to_not have_content("Guernica")

  end
end
