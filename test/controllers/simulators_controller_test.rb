require 'test_helper'

class SimulatorsControllerTest < ActionController::TestCase
  setup do
    @simulator = simulators(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:simulators)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create simulator" do
    assert_difference('Simulator.count') do
      post :create, simulator: { patient_id: @simulator.patient_id }
    end

    assert_redirected_to simulator_path(assigns(:simulator))
  end

  test "should show simulator" do
    get :show, id: @simulator
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @simulator
    assert_response :success
  end

  test "should update simulator" do
    patch :update, id: @simulator, simulator: { patient_id: @simulator.patient_id }
    assert_redirected_to simulator_path(assigns(:simulator))
  end

  test "should destroy simulator" do
    assert_difference('Simulator.count', -1) do
      delete :destroy, id: @simulator
    end

    assert_redirected_to simulators_path
  end
end
