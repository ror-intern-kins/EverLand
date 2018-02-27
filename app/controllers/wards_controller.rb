class WardsController < ApplicationController
  before_action :set_ward, only: [:show, :update, :destroy]

  # GET /wards
  def index
    @wards = Ward.all

    render json: @wards
  end

  # GET /wards/1
  def show
    render json: @ward
  end

  # POST /wards
  def create
    @ward = Ward.new(ward_params)

    if @ward.save
      render json: @ward, status: :created, location: @ward
    else
      render json: @ward.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /wards/1
  def update
    if @ward.update(ward_params)
      render json: @ward
    else
      render json: @ward.errors, status: :unprocessable_entity
    end
  end

  # DELETE /wards/1
  def destroy
    @ward.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ward
      @ward = Ward.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def ward_params
      params.require(:ward).permit(:name)
    end
end
