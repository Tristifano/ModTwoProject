class CreateMovielists < ActiveRecord::Migration[6.0]
  def change
    create_table :movielists do |t|
      t.belongs_to :movie, null: false, foreign_key: true
      t.belongs_to :list, null: false, foreign_key: true

      t.timestamps
    end
  end
end
