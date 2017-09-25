require 'test_helper'

class LicenseplatesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @licenseplate = licenseplates(:one)
  end

  test "should get index" do
    get licenseplates_url
    assert_response :success
  end

  test "should get new" do
    get new_licenseplate_url
    assert_response :success
  end

  test "should create licenseplate" do
    assert_difference('Licenseplate.count') do
      post licenseplates_url, params: { licenseplate: { license_plate: @licenseplate.license_plate, user_id: @licenseplate.user_id } }
    end

    assert_redirected_to licenseplate_url(Licenseplate.last)
  end

  test "should show licenseplate" do
    get licenseplate_url(@licenseplate)
    assert_response :success
  end

  test "should get edit" do
    get edit_licenseplate_url(@licenseplate)
    assert_response :success
  end

  test "should update licenseplate" do
    patch licenseplate_url(@licenseplate), params: { licenseplate: { license_plate: @licenseplate.license_plate, user_id: @licenseplate.user_id } }
    assert_redirected_to licenseplate_url(@licenseplate)
  end

  test "should destroy licenseplate" do
    assert_difference('Licenseplate.count', -1) do
      delete licenseplate_url(@licenseplate)
    end

    assert_redirected_to licenseplates_url
  end
end
