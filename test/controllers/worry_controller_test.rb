require 'test_helper'

class WorryControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get worry_new_url
    assert_response :success
  end

end
