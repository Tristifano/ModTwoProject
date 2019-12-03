class CreateMovies < ActiveRecord::Migration[6.0]
  def change
    create_table :movies do |t|
      t.string :title
      t.string :cast
      t.string :writer
      t.integer :likes
      t.string :released
      t.string :year
      t.string :genre
      t.string :runtime
      t.string :plot
      t.string :image
      t.string :rated

      t.timestamps
    end
  end
end
