When /^I (?:try to )?log a note for (yesterday|today|tomorrow) with the following:$/ do |day, content|
  @note_content = content
  visit new_note_path
  fill_in "Date", with: Date.send(day).to_s
  fill_in "note_content", with: @note_content
  click_button "Save note"
end

When /^I try to log a note$/ do
  visit new_note_path
end

When /^I (?:try to )?view the diary for (yesterday|today)/ do |day|
  date = Date.send(day)
  visit daily_diary_path(date.month, date.day)
end

Then /^I should see the note$/ do
  page.should have_content @note_content
end

Then /^I should be told that I cannot log a note in the future$/ do
  page.should have_content "cannot be in the future"
end

Then /^I should be told that I cannot log two notes for the same day$/ do
  page.should have_content "You have already made a note for this day"
end
