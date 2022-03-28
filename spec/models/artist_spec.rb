require 'rails_helper'

describe Artist, type: :model do
  describe 'relationship' do
    it { should have_many(:paintings)}
  end

  describe 'validations'do
    it { should validate_presence_of :name }
    it { should validate_presence_of :birth_year }
    it {should allow_values(true, false).for(:living)}
    #it { should validate_presence_of :play_count }
  end
end
