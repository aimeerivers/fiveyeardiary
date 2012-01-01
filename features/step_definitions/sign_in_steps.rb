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
