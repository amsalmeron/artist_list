require 'rails_helper'

describe Artist, type: :model do
  describe 'relationship' do
    it { should have_many(:paintings)}
  end

  describe 'validations'do
    it { should validate_presence_of :name }
    it { should validate_presence_of :birth_year }
    it {should allow_values(true, false).for(:living)}
  end

  describe 'sorting' do
    it 'sorts artists by name' do
      artist_1 = Artist.create!(name: "Picasso", birth_year: 1881, living: false)
      artist_2 = Artist.create!(name: "Matisse", birth_year: 1869, living: false)
      artist_3 = Artist.create!(name: "Beeple", birth_year: 1981, living: true)
      artist_4 = Artist.create!(name: "Another One", birth_year: 1981, living: true)
      expect(Artist.sort_alphabetically).to eq([artist_4,artist_3,artist_2,artist_1])
    end

    it 'sorts paintings alphabetically within artists show page' do
      artist_1 = Artist.create!(name: "Picasso", birth_year: 1881, living: false)
      painting_2 = Painting.create!(name: "The Weeping Woman", year_finished: 1937, abstract: true, artist_id: artist_1.id)
      painting_1 = Painting.create!(name: "The Old Guitarist", year_finished: 1904, abstract: false, artist_id: artist_1.id)

      expect(artist_1.sort_alpha).to eq([painting_1,painting_2])
    end
  end
end
