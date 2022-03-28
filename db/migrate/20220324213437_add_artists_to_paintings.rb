class AddArtistsToPaintings < ActiveRecord::Migration[5.2]
  def change
    add_reference :paintings, :artist, foreign_key: true
  end
end
