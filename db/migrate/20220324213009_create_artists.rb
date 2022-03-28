class CreateArtists < ActiveRecord::Migration[5.2]
  def change
    create_table :artists do |t|
      t.string :name
      t.integer :birth_year
      t.boolean :living

      t.timestamps
    end
  end
end
