When /^I log a note for today with the following:$/ do |content|
  @note_content = content
  visit new_note_path
  fill_in "Content", with: @note_content
  click_button "Save note"
end

When /^I try to log a note$/ do
  visit new_note_path
end

When /^I (?:try to )?view the calendar for today$/ do
  date = Date.today
  visit daily_calendar_path(date.month, date.day)
end

Then /^I should see the note$/ do
  page.should have_content @note_content
end
