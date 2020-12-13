class StudentsController < ApplicationController
  # before_action :initialize_filter, only: :index
  def index
    if params[:selected_gender]
      @students = Student.filter_by_gender
      # byebug
    else
      @students = Student.all
    end
    # byebug
    # render 'index'
    # redirect_to :back
  end

  def show
    @student = Student.find(params[:id])
  end

  def new
    @student = Student.new
  end

  def edit
    @student = Student.find(params[:id])
  end

  def create
    @student = Student.new(student_params)

    if @student.save
      redirect_to @student
    else
      render 'new'
    end
  end

  def update
    @student = Student.find(params[:id])

    if @student.update(student_params)
      redirect_to @student
    else
      render 'edit'
    end
  end

  def destroy
    @student = Student.find(params[:id])
    @student.destroy

    redirect_to students_path
  end

  private

  def student_params
    params.require(:student).permit(:name, :surname, :cognomen, :gender, :patronymic)
  end

  def initialize_filter
    # params
  end
end
