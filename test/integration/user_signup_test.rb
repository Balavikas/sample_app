require "test_helper"

class UserSignupTest < ActionDispatch::IntegrationTest
  test "invalid user signup form" do
    get signup_path
    assert_no_difference "User.count" do
      post users_path, params: { user: { name: "foobar", email: "foobaz@co", password: "foo", password_confirmation: "baz" } }
    end
    assert_template "users/new"
    assert_select "div#error-explanation"
    assert_select "input.form-control"
  end

  test "valid sign up" do
    get signup_path
    assert_difference "User.count", 1 do
      post users_path, params: { user: { name: "Tarakram", email: "tarakram@yahoo.com", password: "Foobar!", password_confirmation: "Foobar!" } }
    end
    follow_redirect!
    assert_template "users/show"
    assert_select "div.alert"
    assert is_logged_in?
  end
end
