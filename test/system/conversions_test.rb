require 'application_system_test_case'
class ConversionsTest < ApplicationSystemTestCase
  test "lets a signed in user create a new product" do
    visit root_path
    login_as users(:mario)


    fill_in "amount", with: "1950.1213"
  

    click_on 'submit'
    # save_and_open_screenshot
    # Should be redirected to Home with new product
    visit conversions_path
    assert_selector "td", text: "1950.1213"
  end
end