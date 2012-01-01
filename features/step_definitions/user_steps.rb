Given /^a user called "([^"]*)"$/ do |name|
  identity = Factory(:identity, name: name, email: "#{name.downcase}@test.com")
  Factory(:user, name: name, provider: 'identity', uid: identity.id)
end
