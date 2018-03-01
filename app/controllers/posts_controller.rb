class PostsController < ApplicationController
  before_action :set_post, only: [:show, :update, :destroy]

  # GET /posts
  def index
    @posts = Post.all

    render json: @posts
  end

  # GET /posts/1
  def show
    render json: @post
  end

  # POST /posts
  def create
    @post = Post.new(post_params)

    if @post.save
      render json: @post, status: :created, location: @post
    else
      render json: @post.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /posts/1
  def update
    if @post.update(post_params)
      render json: @post
    else
      render json: @post.errors, status: :unprocessable_entity
    end
  end

  # DELETE /posts/1
  def destroy
    @post.destroy
  end

  # SEARCH /posts/search - Q
  def search
    # query = params[:query]
    query = params.require(:query).permit(:category_id,:area,:price,:city_id)   
    @post = Post.where(query)
        
    if(!@post.empty?)
      render json: @post
    elsif
      render status: 404
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def post_params
      params.require(:post).permit(:title, :city_id, :district, :ward, :street, :address_number, :description, :project, :area, :price, :unit, :lng, :lat, :front, :entrance, :house_direction, :balcony_direction, :floor, :bedroom, :toilet, :furniture, :contact_name, :contact_address, :contact_phone, :contact_mobile, :contact_mail)
    end
end
