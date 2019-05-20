#feature sign in

require 'rails_helper'

RSpec.feature "Sign in", type: :feature do
include Warden::Test::Helpers
# this feature allows you to create a login 
    def setup
     @admin = FactoryBot.create(:admin)
    end


it "should sign up as a user", js: true do
  setup
    visit '/admins/sign_in'
    save_screenshot('flag1.png')
    fill_in "Email", with: "a1@sample.com"
    fill_in "Password", with: "password"
    save_screenshot("flag2.png")
    click_button "Log in" 
    sleep 2
    save_screenshot("flag3.png")
    expect(page).to have_content("Offenses")
    click_link "log out"
    save_screenshot("flag4.png")
    expect(page).to have_content("Sign in")

    end
  end
