require 'spec_helper'

describe "the signin process" do
  it 'signs a user in who uses the right password' do
    visit '/sessions/new'
    user = User.create(:email => 'user@example.com', password => 'password')
    fill_in 'Login', :with => 'user@example.com'
    fill_in 'Password', :width => 'password'
    click_button 'Sign in'
    page.should have_content 'Logged in!'
  end
end
