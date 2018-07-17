class CorrectDataTypeTastingFeeOnWinery < ActiveRecord::Migration[5.2]
  def change
    change_column :wineries, :tasting_fee, "numeric USING CAST(tasting_fee AS numeric)"
	   change_column :wineries, :tasting_fee, :decimal, precision: 9, scale: 2
  end
end
