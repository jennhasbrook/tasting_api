class UpdateAppointmentColumns < ActiveRecord::Migration[5.2]
  def change
  	remove_column :appointments, :appt_time, :time
  	change_column :appointments, :appt_date, :datetime

  end
end
