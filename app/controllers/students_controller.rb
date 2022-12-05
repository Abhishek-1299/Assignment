class StudentsController < ApplicationController
	before_action :set_student, only: %i[show edit update destroy]
	def index
		if params[:keyword].blank?
			@students = Student.all
		else
			@students = Student.where("name LIKE ? OR course_id LIKE ?", params[:keyword] + "%", params[:keyword] + "%")
    	end
	end

	def new
    @student = Student.new
  end

  def create
	  @student = Student.new(student_params)
	  if @student.save
	    redirect_to students_path, notice: 'Student has been created successfully'
	  else
	    render :new
	  end
  end

  	# def show
   #  	@student = Student.find(params[:id])
  	# end

  	# def edit
   #  	@student = Student.find(params[:id])
  	# end

  def update
	  if @student.update(student_params)
	    redirect_to students_path(@student), notice: 'Student has been updated successfully'
	  else
	    render :edit
	  end
  end

  def destroy
    @student.destroy
    redirect_to students_path, notice: 'Student has been deleted successfully'
  end

  private

  def set_student
    @student = Student.find(params[:id])
  end

  def student_params
    params.require(:student).permit(:name, :course_id)
  end
end
