class Api::V1::SchoolsController < ApplicationController
  before_action :set_school, only: [:show, :update, :destroy]

  def index
    @schools = School.all
    render json: @schools
  end

  def show
    render json: @school
  end

  def register
    @school = School.new(school_params)
    if @school.save
      render json: @school, status: :created
    else
      render json: @school.errors, status: :unprocessable_entity
    end
  end

  def update
    if @school.update(school_params)
      render json: @school
    else
      render json: @school.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @school.destroy
    head :no_content
  end

  def login
    name = params[:name]
    location = params[:location]
  
    # Find the school by name and location
    @school = School.find_by(name: name, location: location)
  
    if @school
      # If the school is found
      render json: { message: 'Login successful', school: @school }, status: :ok
    else
      # If the school is not found
      render json: { message: 'Invalid name or location' }, status: :unauthorized
    end
  end
  

  private

  def set_school
    @school = School.find(params[:id])
  end

  def school_params
    params.require(:school).permit(:name, :location, :description) # Adjust permitted attributes
  end
end
