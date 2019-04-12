class CreateSearches < ActiveRecord::Migration[5.2]
  def change
    create_table :searches do |t|
      t.string :VIN
      t.string :email
      t.string :after_date
      t.string :before_date
      t.string :time

      t.timestamps
    end
  end
end
