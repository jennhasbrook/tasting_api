class CreateAppointments < ActiveRecord::Migration[5.2]
  def change
    create_table :appointments do |t|
      t.integer :user_id
      t.integer :winery_id
      t.date :appt_date
      t.time :appt_time

      t.timestamps
    end
  end
end
