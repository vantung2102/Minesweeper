require "test_helper"

class MineSweepersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @mine_sweeper = mine_sweepers(:one)
  end

  test "should get index" do
    get mine_sweepers_url
    assert_response :success
  end

  test "should get new" do
    get new_mine_sweeper_url
    assert_response :success
  end

  test "should create mine_sweeper" do
    assert_difference("MineSweeper.count") do
      post mine_sweepers_url, params: { mine_sweeper: { email: @mine_sweeper.email, name: @mine_sweeper.name } }
    end

    assert_redirected_to mine_sweeper_url(MineSweeper.last)
  end

  test "should show mine_sweeper" do
    get mine_sweeper_url(@mine_sweeper)
    assert_response :success
  end

  test "should get edit" do
    get edit_mine_sweeper_url(@mine_sweeper)
    assert_response :success
  end

  test "should update mine_sweeper" do
    patch mine_sweeper_url(@mine_sweeper), params: { mine_sweeper: { email: @mine_sweeper.email, name: @mine_sweeper.name } }
    assert_redirected_to mine_sweeper_url(@mine_sweeper)
  end

  test "should destroy mine_sweeper" do
    assert_difference("MineSweeper.count", -1) do
      delete mine_sweeper_url(@mine_sweeper)
    end

    assert_redirected_to mine_sweepers_url
  end
end
