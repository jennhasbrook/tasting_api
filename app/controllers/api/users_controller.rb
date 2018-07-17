class Api::UsersController < ApplicationController


	def update
	  @user = User.find_by(id: params[:id])
		@user.name = params[:name] || @user.name
		@user.email = params[:email] || @user.email
		@user.phone_number = params[:phone_number] || @user.phone_number

		if @user.save
			render 'show.json.jbuilder'
		else
			render json: {errors: @user.errors.full_messages}, status: :unprocessable_entity
		end

	end


	def create
    @user = User.new(
      name: params[:name],
      email: params[:email],
      phone_number: params[:phone_number],
      password: params[:password],
      password_confirmation: params[:password_confirmation]
    )
    if @user.save
      render 'show.json.jbuilder'
    else
      render json: {errors: user.errors.full_messages}, status: :unprocessable_entity
    end
  end


  def show
		@user = User.find_by(id: params[:id])
		render 'show.json.jbuilder'

	end


	def destroy

		@user = User.find_by(id: params[:id])
		@user.destroy
		render json: {message: "You have deleted your user profile."}

	end


end

 