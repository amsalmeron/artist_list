class Painting < ApplicationRecord
  belongs_to :artist

  validates_presence_of :name
  validates_presence_of :year_finished
  validates :abstract, inclusion: [true, false]

end
