class Artist < ApplicationRecord
  has_many :paintings, -> { order(year_finished: :desc)}, dependent: :destroy

  validates_presence_of :name
  validates_presence_of :birth_year
  validates :living, inclusion: [true, false]

  def self.sort_alphabetically
    order(:name)
  end

  def sort_alpha
    self.paintings.sort_by {|painting| painting.name}
  end

  def year_limit
    self.paintings.map do |painting|
      painting.destroy if painting.year_finished < painting.year_threshold
    end
  end
end
