require 'rails_helper'

feature 'User can (sign_up/sign_in/sign_out)' do

  let(:user) { create(:user) }
 
  it 'sign up' do
    sign_up(user)
    #save_and_open_page
    expect(page).to have_content('Welcome! You have signed up successfully.')
  end

  it 'sign in' do
    sign_in(user)
    expect(page).to have_content('Signed in successfully.')
  end

  it 'sign out' do
    sign_in(user)
    visit(root_path)
    #save_and_open_page
    click_on('Sign out')
    expect(page).to have_content('Signed out successfully.')
  end

  it 'unregistered user sign in' do
    visit(new_user_session_path)

    fill_in('Email', with: 'unregistered@example.com')
    fill_in('Password', with: '123456')
    click_on('Log in')

    expect(page).to have_content('Invalid Email or password.')
  end
end