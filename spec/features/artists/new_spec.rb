require 'rails_helper'

RSpec.describe 'page to create new artists' do
  it 'links to page to create a new artists' do

    visit '/artists'
    click_link 'New Artist'
    expect(current_path).to eq('/artists/new')
  end

  it 'can create a new artist' do
    visit '/artists/new'

    fill_in('Name', with: 'Fractal')
    fill_in('Birth year', with: 1985)
    fill_in('Living', with: true)
    click_button('Create Artist')

    expect(current_path).to eq("/artists")
    expect(page).to have_content("Fractal")
    expect(page).to have_content(1985)
  end
end
