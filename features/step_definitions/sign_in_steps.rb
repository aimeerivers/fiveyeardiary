When /^I sign in as "([^"]*)"$/ do |name|
  visit sign_in_path
  fill_in "Email", with: "#{name.downcase}@test.com"
  fill_in "Password", with: "passw0rd"
  click_button "Sign in"
end

Then /^"([^"]*)" should be signed in$/ do |name|
  page.should have_content "Hello #{name}"
end
