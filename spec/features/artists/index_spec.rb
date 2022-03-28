require 'rails_helper'

RSpec.describe 'artists index page' do
  before :each do
    @artist_1 = Artist.create!(name: "Picasso", birth_year: 1881, living: false)
    @artist_2 = Artist.create!(name: "Matisse", birth_year: 1869, living: false)
    @artist_3 = Artist.create!(name: "Beeple", birth_year: 1981, living: true)
  end

  it 'displays names of all artists' do

    visit "/artists"

    expect(@artist_3.name).to appear_before(@artist_2.name)
    expect(@artist_2.name).to appear_before(@artist_1.name)
    expect(page).to have_content(@artist_1.name)
    expect(page).to have_content(@artist_2.name)
    expect(page).to have_content(@artist_3.name)
  end

  it 'describes header links' do
    visit "/artists"

    expect(page).to have_content("All Paintings")
    expect(page).to have_content("All Artists")
  end

  # it 'describes link to create a new artist' do
  #   visit "/artists"
  #
  #   expect(page).to have_content("New Artist")
  # end
end