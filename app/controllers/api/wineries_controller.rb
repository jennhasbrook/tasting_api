class Api::WineriesController < ApplicationController


  def index
 	  @wineries = Winery.all
  	
  	name_search = params[:search]
  	if name_search 
  		@wineries = Winery.where("name LIKE ?", "%#{name_search}%")
    end
    render 'index.json.jbuilder'
  end

  
  def update
 		@winery = Winery.find_by(id: params[:id])
 	  	@winery.name = params[:name] || @winery.name
  		@winery.region = params[:region] || @winery.region
  		@winery.city = params[:city] || @winery.city
  		@winery.address = params[:address] || @winery.address
  		@winery.phone_number = params[:phone_number] || @winery.phone_number
  		@winery.tasting_fee = params[:tasting_fee] || @winery.tasting_fee
  		@winery.varietal = params[:varietal] || @winery.varietal
  		@winery.link = params[:link] || @winery.link
  		@winery.description = params[:description] || @winery.description
  		@winery.appt_needed = params[:appt_needed] || @winery.appt_needed
  		@winery.hours = params[:hours] || @winery.hours
  	
  		if winery.save
  			render 'show.json.jbuilder'
  		else
  			render json: {errors: @winery.errors.full_messages}, status: :unprocessable_entity
  		end
  end


  def create
    @winery = Winery.new(
      name: params[:name],
      region: params[:region],
      city: params[:city],
      address: params[:address],
      phone_number: params[:phone_number],
      tasting_fee: params[:tasting_fee],
      varietal: params[:varietal],
      link: params[:link],
      description: params[:description],
      appt_needed: params[:appt_needed], 
      hours: params[:hours] 
      )

    if @winery.save
      render 'show.json.jbuilder'
    else
      render json: {errors: @winery.errors.full_messages}, status: :unprocessable_entity
    end

  end


  def show

    @winery = Winery.find_by(id: params[:id])
    render 'show.json.jbuilder'
  end


  def destroy 
    @winery = Winery.find_by(id: params[:id])
    @winery.destroy
    render json: {message: "Winery deleted"}
  end


end
