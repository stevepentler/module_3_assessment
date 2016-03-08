require_relative '../test_helper'

class DisplaysItemsTest < ActionDispatch::IntegrationTest

  def setup
    Capybara.app = Storedom::Application
  end

  def test_it_reaches_the_root_page
    visit '/'
    assert_equal 200, page.status_code

    within('h1') do
      assert page.has_content?('Items'), "page should have an Items heading"
    end
  end

  def test_searches_by_name
    # VCR.use_cassette('search') do 
      visit '/'
      assert_equal 200, page.status_code

      fill_in "name", with: "Iphone"
      click_on "Search"

      assert_equal "/search", current_path

      assert page.has_content?("sennheiser")
    # end
  end

end
