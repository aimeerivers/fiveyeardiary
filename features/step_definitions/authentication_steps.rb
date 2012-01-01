Given /^I have chosen to sign up$/ do
  visit sign_up_path
end

Given /^I am not signed in$/ do
  visit root_path
  page.should have_no_css('a', text: 'Sign out')
  page.should have_css('a', text: 'Sign in')
end

When /^I sign up with valid details$/ do
  fill_in "Name", with: "Alice"
  fill_in "Email", with: "alice@test.com"
  fill_in "Password", with: "passw0rd"
  fill_in "Confirm Password", with: "passw0rd"
  click_button "Sign up"
end

When /^I sign up with an invalid password$/ do
  fill_in "Password", with: 'test'
  fill_in "Confirm Password", with: 'test'
  click_button "Sign up"
end

When /^I sign in as "([^"]*)"$/ do |name|
  visit sign_in_path
  fill_in "Email", with: "#{name.downcase}@test.com"
  fill_in "Password", with: "passw0rd"
  click_button "Sign in"
end

When /^I sign out$/ do
  click_link "Sign out"
end

Then /^"([^"]*)" should be signed in$/ do |name|
  page.should have_content "Hello #{name}"
end

Then /^I should not be able to sign in$/ do
  page.should have_content "Authentication failed"
end

Then /^I should be signed out$/ do
  page.should have_content "Signed out successfully"
end

Then /^I should be welcomed to the site$/ do
  page.should have_content "Hello Alice"
end

Then /^I should be notified that the password is invalid$/ do
  page.should have_content "Password is too short"
end

Then /^I should see that I must be signed in$/ do
  page.should have_content "Please sign in first"
end
