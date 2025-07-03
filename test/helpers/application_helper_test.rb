require "test_helper"

class ApplicationLayoutHelper < ActionView::TestCase
    def title
        "Ruby on Rails Tutorial Sample App"
    end

    test "full title method" do
        assert_equal full_title, "#{title}"
        assert_equal full_title("Help"), "Help | #{title}"
    end
end
