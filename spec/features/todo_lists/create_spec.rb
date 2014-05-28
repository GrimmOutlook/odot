require 'spec_helper'

describe "Creating todo lists" do
  it "redirects to the todo list index page on success" do
    visit "/todo_lists"
    click_link "New Todo list"
    expect(page).to have_content("New todo_list")

    fill_in "Title", with: "Phone Calls"
    fill_in "Description", with: "Aaron, Chase, Parents"
    click_button "Create Todo list"

    expect(page).to have_content("Phone Calls")
  end

end
