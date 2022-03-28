require 'rails_helper'

RSpec.describe 'artists show page' do
  it 'displays names of all artists' do
    artist_1 = Artist.create!(name: "Picasso", birth_year: 1881, living: false)
    painting_1 = Painting.create!(name: "The Old Guitarist", year_finished: 1904, abstract: false, artist_id: artist_1.id)
    painting_2 = Painting.create!(name: "The Weeping Woman", year_finished: 1937, abstract: true, artist_id: artist_1.id)
    painting_3 = Painting.create!(name: "Guernica", year_finished: 1937, abstract: true, artist_id: artist_1.id)

    visit "/artists/#{artist_1.id}"

    expect(page).to have_content(artist_1.name)
    expect(page).to have_content(artist_1.birth_year)
    expect(page).to have_content(artist_1.living)
    expect(page).to have_content(artist_1.paintings.count)
    expect(page).to have_content("Paintings")
  end
end
