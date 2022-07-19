require "test_helper"

class RedirectpageControllerTest < ActionDispatch::IntegrationTest
  test "should get statuspayment" do
    get redirectpage_statuspayment_url
    assert_response :success
  end
end
