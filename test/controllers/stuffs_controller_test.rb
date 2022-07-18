require "test_helper"

class StuffsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @stuff = stuffs(:one)
  end

  test "should get index" do
    get stuffs_url
    assert_response :success
  end

  test "should get new" do
    get new_stuff_url
    assert_response :success
  end

  test "should create stuff" do
    assert_difference("Stuff.count") do
      post stuffs_url, params: { stuff: { stuff_code: @stuff.stuff_code, stuff_name: @stuff.stuff_name, stuff_price: @stuff.stuff_price } }
    end

    assert_redirected_to stuff_url(Stuff.last)
  end

  test "should show stuff" do
    get stuff_url(@stuff)
    assert_response :success
  end

  test "should get edit" do
    get edit_stuff_url(@stuff)
    assert_response :success
  end

  test "should update stuff" do
    patch stuff_url(@stuff), params: { stuff: { stuff_code: @stuff.stuff_code, stuff_name: @stuff.stuff_name, stuff_price: @stuff.stuff_price } }
    assert_redirected_to stuff_url(@stuff)
  end

  test "should destroy stuff" do
    assert_difference("Stuff.count", -1) do
      delete stuff_url(@stuff)
    end

    assert_redirected_to stuffs_url
  end
end
