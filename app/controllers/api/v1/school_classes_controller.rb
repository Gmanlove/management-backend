class Api::V1::SchoolClassesController < ApplicationController
  before_action :set_school_class, only: [:show, :update, :destroy]

  def index
    @school_classes = SchoolClass.all
    render json: @school_classes
  end

  def show
    render json: @school_class
  end

  def create
    @school_class = SchoolClass.new(school_class_params)
    if @school_class.save
      render json: @school_class, status: :created
    else
      render json: @school_class.errors, status: :unprocessable_entity
    end
  end

  def update
    if @school_class.update(school_class_params)
      render json: @school_class
    else
      render json: @school_class.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @school_class.destroy
    head :no_content
  end

  private

  def set_school_class
    @school_class = SchoolClass.find(params[:id])
  end

  def school_class_params
    params.require(:school_class).permit(:name) # Adjust permitted attributes
  end
end
