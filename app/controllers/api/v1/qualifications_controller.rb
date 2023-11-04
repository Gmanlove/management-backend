class Api::V1::QualificationsController < ApplicationController
  before_action :set_qualification, only: [:show, :update, :destroy]

  def index
    @qualifications = Qualification.all
    render json: @qualifications
  end

  def show
    render json: @qualification
  end

  def create
    @qualification = Qualification.new(qualification_params)
    if @qualification.save
      render json: @qualification, status: :created
    else
      render json: @qualification.errors, status: :unprocessable_entity
    end
  end

  def update
    if @qualification.update(qualification_params)
      render json: @qualification
    else
      render json: @qualification.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @qualification.destroy
    head :no_content
  end

  private

  def set_qualification
    @qualification = Qualification.find(params[:id])
  end

  def qualification_params
    params.require(:qualification).permit(:name) # Adjust permitted attributes
  end
end
