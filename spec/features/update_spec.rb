require 'rails_helper'

feature 'Status Update CRUD' do

  scenario "user can create, update, and delete status updates" do

    visit root_path
    click_on "Create Status Update"
    fill_in "Status", with: "New"
    fill_in "Likes", with: 5
    click_on "Create Status Update"
    expect(page).to have_content("User can't be blank")
    fill_in "User", with: "Joe"
    click_on "Create Status Update"
    click_on "Back to all Updates"
    click_on "edit"
    fill_in "Status", with: "New 2"
    fill_in "User", with: "Joe Blow"
    fill_in "Likes", with: 6
    click_on "Create Status Update"
    expect(page).to have_content("Joe Blow")
    expect(page).to have_content("New 2")
    expect(page).to have_content("6")
    click_on "Back to all Updates"
    click_on "Delete"
    expect(page).to have_no_content("Joe Blow")

  end

end
