class PostDetailsController < ApplicationController
  before_action :set_post_detail, only: [:show, :update, :destroy]

  # GET /post_details
  def index
    @post_details = PostDetail.all

    render json: @post_details
  end

  # GET /post_details/1
  def show
    render json: @post_detail
  end

  # POST /post_details
  def create
    @post_detail = PostDetail.new(post_detail_params)

    if @post_detail.save
      render json: @post_detail, status: :created, location: @post_detail
    else
      render json: @post_detail.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /post_details/1
  def update
    if @post_detail.update(post_detail_params)
      render json: @post_detail
    else
      render json: @post_detail.errors, status: :unprocessable_entity
    end
  end

  # DELETE /post_details/1
  def destroy
    @post_detail.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post_detail
      @post_detail = PostDetail.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def post_detail_params
      params.require(:post_detail).permit(:front, :entrance, :house_direction, :balcony_direction, :floor, :bedroom, :toilet, :furniture, :contact_name, :contact_address, :contact_phone, :contact_mobile, :contact_mail)
    end
end
