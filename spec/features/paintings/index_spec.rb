require 'rails_helper'

RSpec.describe 'painting index' do
  it 'displays paintings and their attributes' do
    artist_1 = Artist.create!(name: "Picasso", birth_year: 1881, living: false)
    artist_2 = Artist.create!(name: "Matisse", birth_year: 1869, living: false)
    artist_3 = Artist.create!(name: "Beeple", birth_year: 1981, living: true)
    painting_1 = Painting.create!(name: "The Old Guitarist", year_finished: 1904, abstract: false, artist_id: artist_1.id)
    painting_2 = Painting.create!(name: "The Weeping Woman", year_finished: 1937, abstract: true, artist_id: artist_1.id)
    painting_3 = Painting.create!(name: "Guernica", year_finished: 1937, abstract: true, artist_id: artist_1.id)
    painting_4 = Painting.create!(name: "The Snail", year_finished: 1953, abstract: true, artist_id: artist_2.id)
    visit '/paintings'

    expect(page).to have_no_content(painting_1.name)
    expect(page).to have_no_content(painting_1.year_finished)
    expect(page).to have_no_content(painting_1.abstract)
    expect(page).to have_content(painting_4.name)
    expect(page).to have_content(painting_4.year_finished)
    expect(page).to have_content(painting_4.abstract)
    expect(page).to have_content(painting_2.name)
    expect(page).to have_content(painting_2.year_finished)
    expect(page).to have_content(painting_2.abstract)
    expect(page).to have_content(painting_3.name)
    expect(page).to have_content(painting_3.year_finished)
    expect(page).to have_content(painting_3.abstract)
  end

  it 'displays link to edit individual painting attributes' do
    artist_1 = Artist.create!(name: "Picasso", birth_year: 1881, living: false)
    artist_2 = Artist.create!(name: "Matisse", birth_year: 1869, living: false)
    artist_3 = Artist.create!(name: "Beeple", birth_year: 1981, living: true)
    painting_1 = Painting.create!(name: "The Old Guitarist", year_finished: 1904, abstract: true, artist_id: artist_1.id)
    painting_2 = Painting.create!(name: "The Weeping Woman", year_finished: 1937, abstract: true, artist_id: artist_1.id)
    painting_3 = Painting.create!(name: "Guernica", year_finished: 1937, abstract: true, artist_id: artist_1.id)
    painting_4 = Painting.create!(name: "The Snail", year_finished: 1953, abstract: true, artist_id: artist_2.id)
    visit "/paintings"
    click_link "Edit #{painting_1.name}"
    expect(current_path).to eq("/paintings/#{painting_1.id}/edit")
    visit "/paintings"
    click_link "Edit #{painting_2.name}"
    expect(current_path).to eq("/paintings/#{painting_2.id}/edit")
    visit "/paintings"
    click_link "Edit #{painting_3.name}"
    expect(current_path).to eq("/paintings/#{painting_3.id}/edit")
    visit "/paintings"
    click_link "Edit #{painting_4.name}"
    expect(current_path).to eq("/paintings/#{painting_4.id}/edit")
  end

end
