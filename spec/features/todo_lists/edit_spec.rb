require 'spec_helper'

describe "Editing todo lists" do
  let!(:todo_list) { TodoList.create(title: "Groceries", description: "dinner, chips, salsa") }

  def update_todo_list(options={})
    options[:title] ||= "Today's List"
    options[:description] ||= "Mundane items"

    todo_list = options[:todo_list]

    visit "/todo_lists"
    within "##{todo_list.id}" do
      click_link "Edit"
    end

    fill_in "Title", with: options[:title]
    fill_in "Description", with: options[:description]
    click_button "Update Todo list"
  end

  it "updates a todo list successfully with correct information" do
    update_todo_list(todo_list: todo_list, title: "New Title", description: "New Descrip")

    todo_list.reload

    expect(page).to have_content("Todo list was successfully updated.")
    expect(todo_list.title).to eq("New Title")
    expect(todo_list.description).to eq("New Descrip")
  end

  it "displays an error when the todo list has no title" do
    update_todo_list(todo_list: todo_list, title: "")
    title = todo_list.title
    todo_list.reload
    expect(todo_list.title)
    expect(page).to have_content("error")
  end

  it "displays an error when the todo list has a title less than 3 characters" do
    update_todo_list(todo_list: todo_list, title: "Hi")
    expect(page).to have_content("error")
  end

  it "displays an error when the todo list has no description" do
    update_todo_list(todo_list: todo_list, description: "")
    expect(page).to have_content("error")
  end

  it "displays an error when the todo list has a description less than 3 characters" do
    update_todo_list(todo_list: todo_list, description: "Jo")
    expect(page).to have_content("error")
  end


end
