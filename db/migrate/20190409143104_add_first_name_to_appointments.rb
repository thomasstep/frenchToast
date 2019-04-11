class AddFirstNameToAppointments < ActiveRecord::Migration[5.2]
  def change
    add_column :appointments, :first_name, :string
    add_column :appointments, :last_name, :string
    add_column :appointments, :phone, :string
    add_column :appointments, :make, :string
    add_column :appointments, :model, :string
    add_column :appointments, :year, :string
  end
end
