require 'rails_helper'

RSpec.describe 'artists show page' do
  it 'displays names of all artists' do
    artist_1 = Artist.create!(name: "Picasso", birth_year: 1881, living: false)
    painting_1 = Painting.create!(name: "The Old Guitarist", year_finished: 1904, abstract: false, artist_id: artist_1.id)

    visit "/paintings/#{painting_1.id}"

    expect(page).to have_content(painting_1.name)
    expect(page).to have_content(painting_1.year_finished)
    expect(page).to have_content(painting_1.abstract)
  end

end
