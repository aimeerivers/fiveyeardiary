Given /^a user called "([^"]*)"$/ do |name|
  identity = Factory(:identity, name: name, email: "#{name.downcase}@test.com")
  Factory(:user, name: name, provider: 'identity', uid: identity.id)
end

Given /^no users have signed up$/ do
  User.count.should == 0
end

Given /^I am signed in as "([^"]*)"$/ do |name|
  step %{a user called "#{name}"}
  step %{I sign in as "#{name}"}
end

When /^I change my name to "([^"]*)"$/ do |new_name|
  visit edit_profile_path
  fill_in "Name", with: new_name
  click_button "Update profile"
end

When /^I change my time zone to "([^"]*)"$/ do |time_zone|
  visit edit_settings_path
  select time_zone, from: "Time zone"
  click_button "Update settings"
end

Then /^I should use the app in Central European Time$/ do
  page.should have_css('.help-block', text: /#{(Time.now + 1.hour).strftime('%H:%M')}/)
end
