require 'rails_helper'

describe "Viewing todo items" do
  let!(:todo_list) { TodoList.create(title: "Groceries", description: "dinner, chips, salsa") }

  before do
    visit "/todo_lists"
    within "##{todo_list.id}" do
        click_link "List Items"
    end
  end

  it "displays the title of the todo list" do
    within "h1" do
      expect(page).to have_content(todo_list.title)
    end
  end

  it "displays no items when a todo list is empty" do
    expect(page.all("ul.todo_items li").size).to eq(0)
  end
end

# To show name of test: rspec --format=documentation spec/features/todo_items/index_spec.rb
