class Appointment < ApplicationRecord

belongs_to :user
belongs_to :winery


def friendly_appt_date
	appt_date.strftime("%A, %d %b %Y %l:%M %p")
end


end
