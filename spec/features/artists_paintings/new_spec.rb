# User Story 13, Parent Child Creation
#
# As a visitor
# When I visit a Parent Childs Index page
# Then I see a link to add a new adoptable child for that parent "Create Child"
# When I click the link
# I am taken to '/parents/:parent_id/child_table_name/new' where I see a form to add a new adoptable child
# When I fill in the form with the child's attributes:
# And I click the button "Create Child"
# Then a `POST` request is sent to '/parents/:parent_id/child_table_name',
# a new child object/row is created for that parent,
# and I am redirected to the Parent Childs Index page where I can see the new child listed
require 'rails_helper'

RSpec.describe 'create new painting for an artist' do
  it 'allow index to link to page to create new painting' do
    artist = Artist.create!(name: "Vincent", birth_year: 1853, living: false)

    visit "/artists/#{artist.id}/paintings"
    click_link "Add New Painting"

    expect(current_path).to eq("/artists/#{artist.id}/paintings/new")
  end

  it 'has form to create a new painting assigned to artist' do
    artist = Artist.create!(name: "Vincent", birth_year: 1853, living: false)
    visit "/artists/#{artist.id}/paintings/new"

    fill_in('Name', with: 'Midnight Moon')
    fill_in('Year finished', with: 2000)
    fill_in('Abstract', with: true)
    click_button('Create Painting')

    expect(current_path).to eq("/artists/#{artist.id}/paintings")
    expect(page).to have_content("Midnight Moon")
    expect(page).to have_content(2000)
    expect(page).to have_content(true)
  end
end
