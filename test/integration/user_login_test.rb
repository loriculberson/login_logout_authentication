require 'test_helper'

class UserLoginTest < ActionDispatch::IntegrationTest
	include Capybara::DSL


  test "user must have username and password" do
  	visit login_path
  	click_link_or_button "Sign in"
  	within("#errors") do
  	assert page.has_content? ('Invalid login')
  	end
	end

	test "registered user can login" do
		user = User.create(username: "Sam", password: "pipen")

		visit login_path  #should see a form
		fill_in "session[username]", with: ('Sam')
		fill_in "session[password]", with: ('pipen')
		click_link_or_button 'Sign in'
		assert page.has_content?('Welcome')
	end

	# test "authenticated user can logout" do
	# 	user = User.create(username: "Sam", password: "pipen")
		
	# 	visit login_path  #should see a form
	# 	fill_in "session[username]", with: ('Sam')
	# 	fill_in "session[password]", with: ('pipen')
	# 	click_link_or_button 'Sign in'
	# 	# user = User.create(username: "Sam", password: "pipen")
	# 	# post '/login', {session: { username: "Sam", password: "pipen"} }
	# 	visit user_path(user)

	# 	click_link_or_button 'Log out'
	# 	within('#logout') do
	# 		assert page.has_content?("Successfully logged out!") 
	# 	end
	# end


end
