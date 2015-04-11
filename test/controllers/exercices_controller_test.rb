require 'test_helper'

class ExercicesControllerTest < ActionController::TestCase
  setup do
    @exercice = exercices(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:exercices)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create exercice" do
    assert_difference('Exercice.count') do
      post :create, exercice: { end_date: @exercice.end_date, start_date: @exercice.start_date }
    end

    assert_redirected_to exercice_path(assigns(:exercice))
  end

  test "should show exercice" do
    get :show, id: @exercice
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @exercice
    assert_response :success
  end

  test "should update exercice" do
    patch :update, id: @exercice, exercice: { end_date: @exercice.end_date, start_date: @exercice.start_date }
    assert_redirected_to exercice_path(assigns(:exercice))
  end

  test "should destroy exercice" do
    assert_difference('Exercice.count', -1) do
      delete :destroy, id: @exercice
    end

    assert_redirected_to exercices_path
  end
end
