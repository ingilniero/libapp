When(/^I fill the new book form with valid data$/) do
  visit new_book_url
  fill_in "book_title", with: "The Hamlet"
  fill_in "book_pages", with: "150"
  fill_in "book_author", with: "William Shakespeare"
  fill_in "book_description", with: "Excellent play!"
  click_button "Create"
end

Then(/^the book should be added to database$/) do
  expect(Book.find_by_title("The Hamlet")).not_to be_nil
end

Then(/^I should see it on library page$/) do
  expect(page).to have_content("The Hamlet")
end

When(/^I fill the new book form with empty title$/) do
   visit new_book_url
   click_button "Create"
end

Then(/^the book should not be added to database$/) do
   expect(Book.count).to eq(0) 
end

Then(/^I should see the new book form with error message$/) do
   expect(page).to have_selector("form#new_book")
   expect(page).to have_selector(".alert-error")
end

Given(/^book "(.*?)" exists$/) do |arg1|
    pending # express the regexp above with the code you wish you had
end

When(/^I go to "(.*?)" book page$/) do |arg1|
    pending # express the regexp above with the code you wish you had
end

Then(/^I should see "(.*?)" book details$/) do |arg1|
    pending # express the regexp above with the code you wish you had
end

Then(/^I should see "(.*?)" book edit link$/) do |arg1|
    pending # express the regexp above with the code you wish you had
end

When(/^I go to nonexistent book page$/) do
    pending # express the regexp above with the code you wish you had
end

Then(/^I should be redirected to library page$/) do
    pending # express the regexp above with the code you wish you had
end

Then(/^I should see "(.*?)" error message$/) do |arg1|
    pending # express the regexp above with the code you wish you had
end

When(/^I change book title to "(.*?)"$/) do |arg1|
    pending # express the regexp above with the code you wish you had
end

Then(/^book "(.*?)" should not exist in database$/) do |arg1|
    pending # express the regexp above with the code you wish you had
end

Then(/^book "(.*?)" should exist in database$/) do |arg1|
    pending # express the regexp above with the code you wish you had
end

Then(/^I should see "(.*?)" book on library$/) do |arg1|
    pending # express the regexp above with the code you wish you had
end

When(/^I delete it$/) do
    pending # express the regexp above with the code you wish you had
end

Then(/^I should not see "(.*?)" book on library page$/) do |arg1|
    pending # express the regexp above with the code you wish you had
end
