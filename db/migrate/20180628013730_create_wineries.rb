class CreateWineries < ActiveRecord::Migration[5.2]
  def change
    create_table :wineries do |t|
      t.string :region
      t.string :subregion
      t.string :name
      t.string :address
      t.string :phone_number
      t.float :tasting_fee
      t.text :tasting_description
      t.text :varietal
      t.string :link
      t.text :description
      t.boolean :appt_needed
      t.text :hours

      t.timestamps
    end
  end
end
