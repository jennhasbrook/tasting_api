json.id user.id
json.name user.name
json.email user.email
json.phone_number user.phone_number

json.appointments do
json.array! user.appointments, partial: 'api/appointments/appointment', as: :appointment
end