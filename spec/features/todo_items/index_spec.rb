require 'spec_helper'

describe "Viewing todo items" do
  let!(:todo_list) { TodoList.create(title: "Groceries", description: "dinner, chips, salsa") }

  it "displays no items when a todo list is empty"
  visit "/todo_lists"
end
