class Api::V1::Users::CoursesController < ApplicationController
	# skip_before_action :verify_authenticity_token
	skip_before_action :authenticate_user!

	def index
		courses = Course.all
		render json: courses, status:200
	end

	def create
		@course = Course.new(course_params)
	    if @course.save
	       return render json: @course ,status: :ok
	    else
      		return render json: @course.errors, status: :unprocessable_entity
    	end
	end


	def show
		@course = Course.find_by(id: params[:id])
	    if @course.present?
	      render json: @course.as_json, status: 200
    	else
      		render json: {error: "not found course"}
    	end
	end

	private
	  def course_params
	    params.permit(:name, :duration)
	  end
end
