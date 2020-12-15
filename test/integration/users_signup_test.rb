require 'test_helper'

class UsersSignupTest < ActionDispatch::IntegrationTest
  test 'invalid user signup' do
    get signup_path # Retrieve page with form to enter data
    assert_no_difference 'User.count' do # make sure the number of users in the db is the same before and after
                                         # the POST submission
      post users_path, params: { user: { name: "",
                                         email: "user@email.invalid",
                                         password: "foo",
                                 password_confirmation: "foobar"} }
                                         # post is a method that make a POST request to the form and the params hash
                                         # is the info that is filled into the form
    end
      assert_template 'users/new'
  end

  test 'valid user signup' do
    get signup_path
    assert_difference "User.count" do
      post users_path, params: { user: { name: "John",
                                         email: "user@email.valid",
                                         password: "foobar",
                                         password_confirmation: "foobar"} }
    end
    follow_redirect!
    assert_template 'users/show'
    assert is_logged_in?
  end
end
