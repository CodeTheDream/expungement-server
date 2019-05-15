#feature sign in
RSpec.describe 'Sign in', :devise, js: true do
  include Features::SessionHelpers
scenario "Only admin users already having an account can sign in"
  signin('a1@sample.com', 'password')
    expect(page).to have_content I1n.t 'devise.failure.invalid', authentication_keys: 'email'
end

scenario 'user can sign in' do
    @admin = create(:admin)
    signin(@admin.email, @admin.password)
    expect(page).to have_content I1n.t 'devise.sessions.signed_in'
  end
