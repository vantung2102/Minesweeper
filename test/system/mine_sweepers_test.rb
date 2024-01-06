require "application_system_test_case"

class MineSweepersTest < ApplicationSystemTestCase
  setup do
    @mine_sweeper = mine_sweepers(:one)
  end

  test "visiting the index" do
    visit mine_sweepers_url
    assert_selector "h1", text: "Mine sweepers"
  end

  test "should create mine sweeper" do
    visit mine_sweepers_url
    click_on "New mine sweeper"

    fill_in "Email", with: @mine_sweeper.email
    fill_in "Name", with: @mine_sweeper.name
    click_on "Create Mine sweeper"

    assert_text "Mine sweeper was successfully created"
    click_on "Back"
  end

  test "should update Mine sweeper" do
    visit mine_sweeper_url(@mine_sweeper)
    click_on "Edit this mine sweeper", match: :first

    fill_in "Email", with: @mine_sweeper.email
    fill_in "Name", with: @mine_sweeper.name
    click_on "Update Mine sweeper"

    assert_text "Mine sweeper was successfully updated"
    click_on "Back"
  end

  test "should destroy Mine sweeper" do
    visit mine_sweeper_url(@mine_sweeper)
    click_on "Destroy this mine sweeper", match: :first

    assert_text "Mine sweeper was successfully destroyed"
  end
end
