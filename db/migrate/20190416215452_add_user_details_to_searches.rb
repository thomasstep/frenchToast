class AddUserDetailsToSearches < ActiveRecord::Migration[5.2]
  def change
    add_column :searches, :first_name, :string
    add_column :searches, :last_name, :string
    add_column :searches, :phone, :string
  end
end
