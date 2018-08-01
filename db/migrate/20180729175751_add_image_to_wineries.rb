class AddImageToWineries < ActiveRecord::Migration[5.2]
  def change
  	add_column :wineries, :image, :string
  end
end
