class CoursesController < ApplicationController
	before_action :set_course, only: %i[ show edit update destroy ]
	
	def index
		@courses = Course.all
	end

	# def show
	# 	@course = Course.find(params[:id])
 #  end

	def new
    @course = Course.new
  end

  def create
	  @course = Course.new(course_params)

	  respond_to do |format|
	    if @course.save
	      format.html { redirect_to course_url(@course), notice: "Course was successfully created." }
	      format.json { render :show, status: :created, location: @course }
	    else
	      format.html { render :new, status: :unprocessable_entity }
	      format.json { render json: @course.errors, status: :unprocessable_entity }
	    end
	  end
  end

  def update
    respond_to do |format|
      if @course.update(course_params)
        format.html { redirect_to course_url(@course), notice: "Course was successfully updated." }
        format.json { render :show, status: :ok, location: @course }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @course.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
  	@course.destroy
  	redirect_to courses_path, notice: 'Course has been deleted successfully'
  end


  private

  def set_course
    @course = Course.find(params[:id])
  end

  def course_params
    params.require(:course).permit(:name, :duration)
  end
end
