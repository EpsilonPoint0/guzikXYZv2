require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    @user = User.new(name: "Example", email: "user@example.com",
                     password: "foobar", password_confirmation: "foobar")
  end

  test "should validate user" do
    assert @user.password == "foobar"
    assert @user.password_confirmation == "foobar"
    assert @user.valid?
  end

  test "name should be present" do
    @user.name = " "
    assert_not @user.valid?
  end

  test "email should be present" do
    @user.email = " "
    assert_not @user.valid?
  end

  test "name not too long" do
    @user.name = "a" * 50
    assert_not @user.valid?
  end

  test "email not too long" do
    @user.email = "a" * 100 + "@example.com"
    assert_not @user.valid?
  end

  test "email should accept valid format" do
    valid_addresses = %w[user@example.com USER@foo.COM A_US-ER@foo.bar.org
                         first.last@foo.jp alice+bob@baz.cn]
    valid_addresses.each do |valid_address|
      @user.email = valid_address
      assert @user.valid?, "#{valid_address.inspect} should be valid"
    end
  end

  test "email should reject invalid format" do
    invalid_addresses = %w[user@example,com USER_at_foo.COM A_US.ER@org
                         first@foo_bar.com alice@baz+bob.cn]
    invalid_addresses.each do |invalid_address|
      @user.email = invalid_address
      assert_not @user.valid?, "#{invalid_address.inspect} should be invalid"
    end
  end

  test "email address unique" do
    duplicate_user = @user.dup
    @user.save
    assert_not duplicate_user.valid?
  end

  test "password should be present (nonblank)" do
    @user.password = " " * 6
    @user.password_confirmation = @user.password
    assert_not @user.valid?
  end

  test "password should have a minimum length" do
    @user.password = @user.password_confirmation = "a" * 5
    assert @user.valid?
  end

end
