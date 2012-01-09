When /^I (?:try to )?log a note for (yesterday|today|tomorrow) with the following:$/ do |day, content|
  date = Date.send(day).to_s
  @note_content = content
  log_note(content, date: date)
end

When /^I log a note with the following:$/ do |content|
  @note_content = content
  log_note(content)
end

Given /^I logged a note (\d+) days ago with the following:$/ do |number, content|
  date = Date.today - number.to_i.days
  @previous_note_content = content
  log_note(content, date: date)
end

When /^I try to log a note$/ do
  visit new_note_path
end

When /^I (?:try to )?view the diary for (yesterday|today)/ do |day|
  date = Date.send(day)
  visit daily_diary_path(date.month, date.day)
end

When /^I go to the week day page for the current day of the week/ do
  date = Date.today
  visit week_day_diary_path(date.strftime('%A'))
end

When /^I edit the note and change the date to yesterday/ do
  within('.note') { click_link 'Edit note' }
  fill_in 'Date', with: Date.yesterday
  click_button 'Update note'
end

Then /^I should see the note$/ do
  within('.note') { page.should have_content @note_content }
end

Then /^I should see both notes$/ do
  within('.notes .note:nth-child(1)') { page.should have_content @previous_note_content }
  within('.notes .note:nth-child(2)') { page.should have_content @note_content }
end

Then /^I should be told that I cannot log a note in the future$/ do
  page.should have_content "cannot be in the future"
end

Then /^I should be told that I cannot log two notes for the same day$/ do
  page.should have_content "You have already made a note for this day"
end

Then /^the date should be set to yesterday$/ do
  page.should have_css('h1', text: Date.yesterday.strftime('%B %e'))
end

def log_note(content, options={})
  visit new_note_path
  fill_in "Date", with: options[:date] if options[:date]
  fill_in "note_content", with: content
  click_button "Save note"
end
