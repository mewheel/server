require 'test_helper'

class ReflectionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @reflection = reflections(:one)
  end

  test "should get index" do
    get reflections_url, as: :json
    assert_response :success
  end

  test "should create reflection" do
    assert_difference('Reflection.count') do
      post reflections_url, params: { reflection: {  } }, as: :json
    end

    assert_response 201
  end

  test "should show reflection" do
    get reflection_url(@reflection), as: :json
    assert_response :success
  end

  test "should update reflection" do
    patch reflection_url(@reflection), params: { reflection: {  } }, as: :json
    assert_response 200
  end

  test "should destroy reflection" do
    assert_difference('Reflection.count', -1) do
      delete reflection_url(@reflection), as: :json
    end

    assert_response 204
  end
end
