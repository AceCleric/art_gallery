class StudentController < ApplicationController

  def index
    @students = Student.all
  end

  def show
  end

  def edit
  end

  def update
  end
end
