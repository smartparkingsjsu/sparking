require 'test_helper'

class GarageSpotsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @garage_spot = garage_spots(:one)
  end

  test "should get index" do
    get garage_spots_url
    assert_response :success
  end

  test "should get new" do
    get new_garage_spot_url
    assert_response :success
  end

  test "should create garage_spot" do
    assert_difference('GarageSpot.count') do
      post garage_spots_url, params: { garage_spot: { garage_id: @garage_spot.garage_id, spot_id: @garage_spot.spot_id } }
    end

    assert_redirected_to garage_spot_url(GarageSpot.last)
  end

  test "should show garage_spot" do
    get garage_spot_url(@garage_spot)
    assert_response :success
  end

  test "should get edit" do
    get edit_garage_spot_url(@garage_spot)
    assert_response :success
  end

  test "should update garage_spot" do
    patch garage_spot_url(@garage_spot), params: { garage_spot: { garage_id: @garage_spot.garage_id, spot_id: @garage_spot.spot_id } }
    assert_redirected_to garage_spot_url(@garage_spot)
  end

  test "should destroy garage_spot" do
    assert_difference('GarageSpot.count', -1) do
      delete garage_spot_url(@garage_spot)
    end

    assert_redirected_to garage_spots_url
  end
end
