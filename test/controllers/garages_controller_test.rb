require 'test_helper'

class GaragesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @garage = garages(:one)
  end

  test "should get index" do
    get garages_url
    assert_response :success
  end

  test "should get new" do
    get new_garage_url
    assert_response :success
  end

  test "should create garage" do
    assert_difference('Garage.count') do
      post garages_url, params: { garage: { latitude: @garage.latitude, longitude: @garage.longitude, name: @garage.name } }
    end

    assert_redirected_to garage_url(Garage.last)
  end

  test "should show garage" do
    get garage_url(@garage)
    assert_response :success
  end

  test "should get edit" do
    get edit_garage_url(@garage)
    assert_response :success
  end

  test "should update garage" do
    patch garage_url(@garage), params: { garage: { latitude: @garage.latitude, longitude: @garage.longitude, name: @garage.name } }
    assert_redirected_to garage_url(@garage)
  end

  test "should destroy garage" do
    assert_difference('Garage.count', -1) do
      delete garage_url(@garage)
    end

    assert_redirected_to garages_url
  end
end
