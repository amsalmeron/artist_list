require 'rails_helper'

describe Painting, type: :model do
  describe 'relationships' do
    it {should belong_to(:artist)}
  end

  describe 'validations'do
    it { should validate_presence_of :name }
    it { should validate_presence_of :year_finished }
    it {should allow_values(true, false).for(:abstract)}
  end

  describe 'order paintings alphabetically' do
    it 'orders paintings alphabetically by name' do
      artist_1 = Artist.create!(name: "Picasso", birth_year: 1881, living: false)
      painting_1 = Painting.create!(name: "The Old Guitarist", year_finished: 1904, abstract: false, artist_id: artist_1.id)
      painting_2 = Painting.create!(name: "The Weeping Woman", year_finished: 1937, abstract: true, artist_id: artist_1.id)
      painting_3 = Painting.create!(name: "Guernica", year_finished: 1937, abstract: true, artist_id: artist_1.id)
      expect(Painting.sort_alphabetically).to eq([painting_3,painting_1,painting_2])
    end
  end
end
