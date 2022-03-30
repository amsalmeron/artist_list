require 'rails_helper'

RSpec.describe 'artists edit' do
  it 'links to artists edit page' do
    artist = Artist.create!(name: "Vincent", birth_year: 1853, living: false)

    visit "/artists/#{artist.id}"
    click_button "Edit #{artist.name}"

    expect(current_path).to eq("/artists/#{artist.id}/edit")
  end

  it 'can edit artist page' do
    artist = Artist.create!(name: "Vincen", birth_year: 185, living: true)

    visit "/artists/#{artist.id}"
    expect(page).to have_content('Vincen')
    click_button 'Edit Vincen'

    fill_in 'Name', with: 'Vincent'
    fill_in 'Birth year', with: 1853
    fill_in "Living (true/false)", with: false
    click_button 'Update Artist'

    expect(current_path).to eq("/artists/#{artist.id}")
    expect(page).to have_content("Vincent")
    expect(page).to have_content(1853)
  end
end
