Todo::Application.routes.draw do
  get 'todo_items/index'

  resources :todo_lists

  root :to => 'todo_lists#index'
end
