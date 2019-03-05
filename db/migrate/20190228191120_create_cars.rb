class CreateCars < ActiveRecord::Migration[5.2]
  def change
    create_table :cars do |t|
      t.string :VIN
      t.string :make
      t.string :model
      t.integer :year
      t.string :owner
      t.string :email
      t.string :appointments

      t.timestamps
    end
  end
end
