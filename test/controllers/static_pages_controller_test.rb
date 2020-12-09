require 'test_helper'

class StaticPagesControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get home_path
    assert_response :success
    assert_select "title", "Home | The GuzikXYZv2 Project"
  end

  test "should get help" do
    get help_path
    assert_response :success
    assert_select "title", "Help | The GuzikXYZv2 Project"
  end

  test "should get placeholder" do
    get placeholder_path
    assert_response :success
    assert_select "title", "Home | The GuzikXYZv2 Project"
  end

  test "should get about" do
    get about_path
    assert_response :success
    assert_select "title", "About | The GuzikXYZv2 Project"
  end

  test "should get contact" do
    get contact_path
    assert_response :success
    assert_select "title", "Contact | The GuzikXYZv2 Project"
  end
end
