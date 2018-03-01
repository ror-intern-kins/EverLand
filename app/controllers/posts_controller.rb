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
    @user = User.find(params[:user_id])
    @post = @user.posts.new(post_params)
    
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
    search_type = params[:search_type]
    case search_type
    when "advance"
    query = params.require(:query).permit(:category_id,:area,:price,:city_id)   
    @post = Post.where(query)
    when "full"
      text = params.require(:query).permit(:full_text)  
      @post = Post.where("title LIKE ? OR address_number LIKE ? OR description LIKE ?", "%" + text[:full_text] + "%","%" + text[:full_text] + "%","%" + text[:full_text] + "%"   )   
    end
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
      params.require(:post).permit(:title,:description, :user_id,
      :category_id, :city_id, :district_id, :ward_id, 
      :street_id, :address_number,:project, :unit, 
      :area, :price,:front, :entrance,
      :lng, :lat, 
      :house_direction, :balcony_direction, 
      :floor, :bedroom, :toilet, :furniture, 
      :contact_name, :contact_address, :contact_phone, :contact_mobile, :contact_mail)
    end
end
