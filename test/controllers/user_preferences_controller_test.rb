require 'test_helper'

class UserPreferencesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user_preference = user_preferences(:one)
  end

  test "should get index" do
    get user_preferences_url, as: :json
    assert_response :success
  end

  test "should create user_preference" do
    assert_difference('UserPreference.count') do
      post user_preferences_url, params: { user_preference: { calories: @user_preference.calories, carbs: @user_preference.carbs, fats: @user_preference.fats, protein: @user_preference.protein, username: @user_preference.username } }, as: :json
    end

    assert_response 201
  end

  test "should show user_preference" do
    get user_preference_url(@user_preference), as: :json
    assert_response :success
  end

  test "should update user_preference" do
    patch user_preference_url(@user_preference), params: { user_preference: { calories: @user_preference.calories, carbs: @user_preference.carbs, fats: @user_preference.fats, protein: @user_preference.protein, username: @user_preference.username } }, as: :json
    assert_response 200
  end

  test "should destroy user_preference" do
    assert_difference('UserPreference.count', -1) do
      delete user_preference_url(@user_preference), as: :json
    end

    assert_response 204
  end
end
