class CreateAppointments < ActiveRecord::Migration[5.2]
  def change
    create_table :appointments do |t|
      t.string :VIN
      t.string :owner_email
      t.string :date
      t.string :time
      t.string :reason
      t.string :parts_needed
      t.string :hours_needed
      t.string :cost

      t.timestamps
    end
  end
end
