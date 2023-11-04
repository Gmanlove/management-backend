class Api::V1::SectionsController < ApplicationController
  before_action :set_section, only: [:show, :update, :destroy]

  def index
    @sections = Section.all
    render json: @sections
  end

  def show
    render json: @section
  end

  def create
    @section = Section.new(section_params)
    if @section.save
      render json: @section, status: :created
    else
      render json: @section.errors, status: :unprocessable_entity
    end
  end

  def update
    if @section.update(section_params)
      render json: @section
    else
      render json: @section.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @section.destroy
    head :no_content
  end

  private

  def set_section
    @section = Section.find(params[:id])
  end

  def section_params
    params.require(:section).permit(:name) # Adjust permitted attributes
  end
end
