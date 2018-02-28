require 'test_helper'

class PostsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @post = posts(:one)
  end

  test "should get index" do
    get posts_url, as: :json
    assert_response :success
  end

  test "should create post" do
    assert_difference('Post.count') do
      post posts_url, params: { post: { address_number: @post.address_number, area: @post.area, balcony_direction: @post.balcony_direction, bedroom: @post.bedroom, city_id: @post.city_id, contact_address: @post.contact_address, contact_mail: @post.contact_mail, contact_mobile: @post.contact_mobile, contact_name: @post.contact_name, contact_phone: @post.contact_phone, description: @post.description, district: @post.district, entrance: @post.entrance, floor: @post.floor, front: @post.front, furniture: @post.furniture, house_direction: @post.house_direction, lat: @post.lat, lng: @post.lng, price: @post.price, project: @post.project, street: @post.street, title: @post.title, toilet: @post.toilet, unit: @post.unit, ward: @post.ward } }, as: :json
    end

    assert_response 201
  end

  test "should show post" do
    get post_url(@post), as: :json
    assert_response :success
  end

  test "should update post" do
    patch post_url(@post), params: { post: { address_number: @post.address_number, area: @post.area, balcony_direction: @post.balcony_direction, bedroom: @post.bedroom, city_id: @post.city_id, contact_address: @post.contact_address, contact_mail: @post.contact_mail, contact_mobile: @post.contact_mobile, contact_name: @post.contact_name, contact_phone: @post.contact_phone, description: @post.description, district: @post.district, entrance: @post.entrance, floor: @post.floor, front: @post.front, furniture: @post.furniture, house_direction: @post.house_direction, lat: @post.lat, lng: @post.lng, price: @post.price, project: @post.project, street: @post.street, title: @post.title, toilet: @post.toilet, unit: @post.unit, ward: @post.ward } }, as: :json
    assert_response 200
  end

  test "should destroy post" do
    assert_difference('Post.count', -1) do
      delete post_url(@post), as: :json
    end

    assert_response 204
  end
end
