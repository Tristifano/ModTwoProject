class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :username
      t.string :email
      t.string :password
      t.string :name
      t.integer :age
      t.string :location
      t.string :image

      t.timestamps
    end
  end
end
