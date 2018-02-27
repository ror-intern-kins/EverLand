require 'test_helper'

class PostDetailsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @post_detail = post_details(:one)
  end

  test "should get index" do
    get post_details_url, as: :json
    assert_response :success
  end

  test "should create post_detail" do
    assert_difference('PostDetail.count') do
      post post_details_url, params: { post_detail: { balcony_direction: @post_detail.balcony_direction, bedroom: @post_detail.bedroom, contact_address: @post_detail.contact_address, contact_mail: @post_detail.contact_mail, contact_mobile: @post_detail.contact_mobile, contact_name: @post_detail.contact_name, contact_phone: @post_detail.contact_phone, entrance: @post_detail.entrance, floor: @post_detail.floor, front: @post_detail.front, furniture: @post_detail.furniture, house_direction: @post_detail.house_direction, toilet: @post_detail.toilet } }, as: :json
    end

    assert_response 201
  end

  test "should show post_detail" do
    get post_detail_url(@post_detail), as: :json
    assert_response :success
  end

  test "should update post_detail" do
    patch post_detail_url(@post_detail), params: { post_detail: { balcony_direction: @post_detail.balcony_direction, bedroom: @post_detail.bedroom, contact_address: @post_detail.contact_address, contact_mail: @post_detail.contact_mail, contact_mobile: @post_detail.contact_mobile, contact_name: @post_detail.contact_name, contact_phone: @post_detail.contact_phone, entrance: @post_detail.entrance, floor: @post_detail.floor, front: @post_detail.front, furniture: @post_detail.furniture, house_direction: @post_detail.house_direction, toilet: @post_detail.toilet } }, as: :json
    assert_response 200
  end

  test "should destroy post_detail" do
    assert_difference('PostDetail.count', -1) do
      delete post_detail_url(@post_detail), as: :json
    end

    assert_response 204
  end
end
