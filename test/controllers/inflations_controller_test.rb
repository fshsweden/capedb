require 'test_helper'

class InflationsControllerTest < ActionController::TestCase
  setup do
    @inflation = inflations(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:inflations)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create inflation" do
    assert_difference('Inflation.count') do
      post :create, inflation: { country: @inflation.country, inflation: @inflation.inflation, year: @inflation.year }
    end

    assert_redirected_to inflation_path(assigns(:inflation))
  end

  test "should show inflation" do
    get :show, id: @inflation
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @inflation
    assert_response :success
  end

  test "should update inflation" do
    patch :update, id: @inflation, inflation: { country: @inflation.country, inflation: @inflation.inflation, year: @inflation.year }
    assert_redirected_to inflation_path(assigns(:inflation))
  end

  test "should destroy inflation" do
    assert_difference('Inflation.count', -1) do
      delete :destroy, id: @inflation
    end

    assert_redirected_to inflations_path
  end
end
