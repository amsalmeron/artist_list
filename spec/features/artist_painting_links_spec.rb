require 'rails_helper'

describe 'links supposed to be on all pages' do

  it 'has link that leads to all artists and paintings' do
    artist = Artist.create!(name: "Picasso", birth_year: 1881, living: false)
    painting = artist.paintings.create!(name: "The Old Guitarist", year_finished: 1904, abstract: false)

    pages = ["/artists","/artists/#{artist.id}","/paintings","/paintings/#{painting.id}"]

    pages.each do |page|
      visit page

      click_link "All Artists"

      expect(current_path).to eq('/artists')

      click_link "All Paintings"

      expect(current_path).to eq('/paintings')
    end
  end

end
