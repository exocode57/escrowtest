require "application_system_test_case"

class StuffsTest < ApplicationSystemTestCase
  setup do
    @stuff = stuffs(:one)
  end

  test "visiting the index" do
    visit stuffs_url
    assert_selector "h1", text: "Stuffs"
  end

  test "should create stuff" do
    visit stuffs_url
    click_on "New stuff"

    fill_in "Stuff code", with: @stuff.stuff_code
    fill_in "Stuff name", with: @stuff.stuff_name
    fill_in "Stuff price", with: @stuff.stuff_price
    click_on "Create Stuff"

    assert_text "Stuff was successfully created"
    click_on "Back"
  end

  test "should update Stuff" do
    visit stuff_url(@stuff)
    click_on "Edit this stuff", match: :first

    fill_in "Stuff code", with: @stuff.stuff_code
    fill_in "Stuff name", with: @stuff.stuff_name
    fill_in "Stuff price", with: @stuff.stuff_price
    click_on "Update Stuff"

    assert_text "Stuff was successfully updated"
    click_on "Back"
  end

  test "should destroy Stuff" do
    visit stuff_url(@stuff)
    click_on "Destroy this stuff", match: :first

    assert_text "Stuff was successfully destroyed"
  end
end
