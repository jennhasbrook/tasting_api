class Api::AppointmentsController < ApplicationController


	def index
		@appointments = Appointment.all

		render 'index.json.jbuilder'
	end


	def show
		@appointment = Appointment.find_by(id: params[:id])

		render 'show.json.jbuilder'
	end


	def create
		@appointment = Appointment.new(
			winery_id: params[:winery_id],
			user_id: current_user.id,
			appt_date:  params[:appt_date]
			)
		if @appointment.save
			render 'show.json.jbuilder'
		else
			render json: {errors: @appointment.errors.full_messages}, status: :unprocessable_entity
		end

	end


	def update

		@appointment = Appointment.find_by(id: params[:id])
		# @appointment.id = params[:id]
		@appointment.user_id = params[:user_id] || @appointment.user_id
		@appointment.winery_id = params[:winery_id] || @appointment.winery_id
		@appointment.appt_date = params[:appt_date] || @appointment.appt_date


		if @appointment.save
			render 'show.json.jbuilder'
		else
			render json: {errors: @appointment.errors.full_messages}, status: :unprocessable_entity
		end

	end


	def destroy
		@appointment = Appointment.find_by(id: params[:id])
		@appointment.destroy

		render json: {message: "You have successfully deleted your tasing appointment."}

	end

end
