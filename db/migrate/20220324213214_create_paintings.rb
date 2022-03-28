class CreatePaintings < ActiveRecord::Migration[5.2]
  def change
    create_table :paintings do |t|
      t.string :name
      t.integer :year_finished
      t.boolean :abstract

      t.timestamps
    end
  end
end
