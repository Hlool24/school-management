class SchoolsController < ApplicationController
  before_action :set_school, only: %i[show edit update destroy]
  
  def index
    if params[:search]
      @schools = School.search(params[:search])
    else 
      @schools = School.all
    end
  end

  def show 
  end

  def new 
    @school = School.new
  end

  def create
    @school = School.new(school_params)
    if @school.save
      redirect_to @school
    else 
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @school.update(school_params)
      redirect_to @school
    else 
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @school.destroy
    redirect_to schools_path
  end

  private

  def school_params
    params.expect(school: [:name_ar, :name_en, :status, :address])
  end

  def set_school
    @school = School.find(params[:id]) 
  end
end
