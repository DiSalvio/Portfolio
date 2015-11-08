require 'rails_helper'

RSpec.describe PagesController, type: :controller do
  
  describe "GET home" do
    it "Navigates to the home page" do
      get :home
      assert_response 200
    end
  end

  describe "GET contact" do
    it "Navigates to the contact page" do
      get :contact
      assert_response 200
    end
  end
end
