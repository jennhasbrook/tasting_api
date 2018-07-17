class AddCityToWinery < ActiveRecord::Migration[5.2]
  def change
    add_column :wineries, :city, :string
  end
end
