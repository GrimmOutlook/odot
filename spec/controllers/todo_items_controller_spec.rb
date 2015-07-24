require 'rails_helper'

describe TodoItemsController, type: :controller do

  describe "GET 'index'" do
    it "returns http success" do
      get 'index'
      response.should be_success
    end
  end

end
