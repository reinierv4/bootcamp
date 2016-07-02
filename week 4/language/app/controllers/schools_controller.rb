class SchoolsController < ApplicationController
	before_action :authenticate_admin!, only: [:admin_index, :edit, :create, :new]

	def index
		# def static_map_for(location, options = {})
  #   	params = {
	 #      :center => [location.lat, location.lon].join(","),
	 #      :zoom => 15,
	 #      :size => "300x300",
	 #      :markers => [location.lat, location.lon].join(","),
	 #      :sensor => true
	 #      }.merge(options)
		# 	query_string =  params.map{|k,v| "#{k}=#{v}"}.join("&")
	 #    	"http://maps.googleapis.com/maps/api/staticmap?#{query_string}"
	 #    	&markers=#{location.latitude}%2C#{location.longitude}
  # 		end

		@schools = School.all
		#@school.each do |school|
		#@url = static_map_for(school_map)
		
  	end
	def new
		@school = School.new
	end

	def create
		school = School.new(school_params)
		school.save
		redirect_to schools_admin_index_path
	end

	def admin_index
		@schools = School.all
	end

	def show
		@school = School.find(params[:id])
	end

	def edit
		@school = School.find(params[:id])
	end

	def destroy
		School.find(params[:id]).destroy
		redirect_to schools_admin_index_path
	end

	def update
		school = School.find(params[:id])
		if school.update(school_params)
			redirect_to schools_admin_index_path
		else
			redirect_to edit_school_path(school)
		end

	end


	
	private

	def school_params
		params.require(:school).permit(:name, :contact, :city, :price, :description, :lat, :lon, :image)
	end


end
