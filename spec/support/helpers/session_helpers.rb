module Features
  module SessionHelpers
    
    def signin(email, password)
      visit new_admin_session_path
      fill_in 'Email', with: 'a1@sample.com'
      fill_in 'Password', with: 'password'
      # save_and_open_page
      click_button 'Sign in'
    end
  end
end
