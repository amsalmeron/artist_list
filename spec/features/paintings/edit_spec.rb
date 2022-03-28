require 'rails_helper'

RSpec.describe 'artists edit' do

  it 'displays link to update paintings' do
    artist_1 = Artist.create!(name: "Picasso", birth_year: 1881, living: false)
    painting_1 = Painting.create!(name: "The Old Guitarist", year_finished: 1904, abstract: false, artist_id: artist_1.id)
    visit "/paintings/#{painting_1.id}"
    click_link "Update Painting"

    expect(current_path).to eq("/paintings/#{painting_1.id}/edit")
  end

  it 'can edit artist page' do
    artist = Artist.create!(name: "Vincent", birth_year: 1881, living: false)
    painting = artist.paintings.create!(name: "Mooo", year_finished: 1, abstract: true)

    visit "/paintings/#{painting.id}/edit"

    fill_in 'Name', with: 'Bahhhh'
    fill_in 'Year finished', with: 2
    fill_in 'Abstract', with: false
    click_button "Update Painting"

    expect(current_path).to eq("/paintings/#{painting.id}")
    expect(page).to have_content("Bahhh")
    expect(page).to have_content(2)
  end
end
