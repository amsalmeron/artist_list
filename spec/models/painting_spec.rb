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
end
