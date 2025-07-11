require "test_helper"

class UserLoginTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:uday)
  end

  test "invalid login" do
    get login_path
    assert_template "sessions/new"
    post login_path, params: { session: { email: " ", password: " " } }
    assert_template "sessions/new"
    assert_not flash.empty?
    get root_path
    assert_not flash.empty?
  end

  test "valid login" do
    get login_path
    assert_template "sessions/new"
    post login_path, params: { session: { email: @user.email, password: "New1user!" } }
    follow_redirect!
    assert_template "users/show"
    assert_select "a[href=?]", login_path, count: 0
    assert_select "a[href=?]", logout_path
    assert_select "a[href=?]", user_path(@user)
  end
end
