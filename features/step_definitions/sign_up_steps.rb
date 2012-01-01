Given /^I have chosen to sign up$/ do
  visit sign_up_path
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

Then /^I should be welcomed to the site$/ do
  page.should have_content "Hello Alice"
end

Then /^I should be notified that the password is invalid$/ do
  page.should have_content "Password is too short"
end
