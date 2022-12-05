class Api::V1::Users::StudentsController < ApplicationController
	skip_before_action :authenticate_user!
	def index
		@students = Student.all
		render json: @students, status:200
	end

	def create
		@student = Student.new(student_params)
	    if @student.save
	       return render json: @student ,status: :ok
	    else
      		return render json: @student.errors, status: :unprocessable_entity
    	end
	end

	def show
		@student = Student.find_by(id: params[:id])
	    if @student.present?
	      render json: @student.as_json, status: 200
    	else
      		render json: {error: "not found student"}
    	end
	end

	def search
		student = Student.where(name: params[:name])
			render json: student.as_json, status: 200
	end

	private
	  def student_params
	    params.permit(:name, :course_id)
	  end

end



		# if [:name].persent?
		# 	student = Student.where(:name params[:name])
		# else
		# 	Student.all