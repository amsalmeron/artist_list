require 'rails_helper'

RSpec.describe 'artist index page' do
  it 'displays names of all paintings by given artist' do
    artist_1 = Artist.create!(name: "Picasso", birth_year: 1881, living: false)
    painting_2 = Painting.create!(name: "The Weeping Woman", year_finished: 1937, abstract: true, artist_id: artist_1.id)
    painting_1 = Painting.create!(name: "The Old Guitarist", year_finished: 1904, abstract: false, artist_id: artist_1.id)

    visit "/artists/#{artist_1.id}/paintings"

    expect(page).to have_content(painting_1.name)
    expect(page).to have_content(painting_1.year_finished)
    expect(page).to have_content(painting_1.abstract)
    expect(page).to have_content(painting_2.name)
    expect(page).to have_content(painting_2.year_finished)
    expect(page).to have_content(painting_2.abstract)
  end

  it 'displays link and when clicked sorts painting by alphabetical order' do
    artist_1 = Artist.create!(name: "Picasso", birth_year: 1881, living: false)
    painting_2 = Painting.create!(name: "The Weeping Woman", year_finished: 1937, abstract: true, artist_id: artist_1.id)
    painting_1 = Painting.create!(name: "The Old Guitarist", year_finished: 1904, abstract: false, artist_id: artist_1.id)

    visit "/artists/#{artist_1.id}/paintings"
    expect(painting_2.name).to appear_before(painting_1.name)
    click_link "Sort by Alphabetical Order"
    expect(painting_1.name).to appear_before(painting_2.name)

  end
end
