require 'test_helper'

class RentRequestsControllerTest < ActionController::TestCase
  setup do
    @rent_request = rent_requests(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:rent_requests)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create rent_request" do
    assert_difference('RentRequest.count') do
      post :create, rent_request: { bike_id: @rent_request.bike_id, email: @rent_request.email, name: @rent_request.name, rent_duration: @rent_request.rent_duration, rent_type: @rent_request.rent_type }
    end

    assert_redirected_to rent_request_path(assigns(:rent_request))
  end

  test "should show rent_request" do
    get :show, id: @rent_request
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @rent_request
    assert_response :success
  end

  test "should update rent_request" do
    patch :update, id: @rent_request, rent_request: { bike_id: @rent_request.bike_id, email: @rent_request.email, name: @rent_request.name, rent_duration: @rent_request.rent_duration, rent_type: @rent_request.rent_type }
    assert_redirected_to rent_request_path(assigns(:rent_request))
  end

  test "should destroy rent_request" do
    assert_difference('RentRequest.count', -1) do
      delete :destroy, id: @rent_request
    end

    assert_redirected_to rent_requests_path
  end
end
