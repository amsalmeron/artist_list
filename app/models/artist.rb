class Artist < ApplicationRecord
  has_many :paintings, -> { order(year_finished: :desc)}

  validates_presence_of :name
  validates_presence_of :birth_year
  validates :living, inclusion: [true, false]
  
  def self.sort_alphabetically
    Artist.order(:name)
  end
end
