require 'rails_helper'

RSpec.describe "MainPages" do

  describe "Main page" do
    it "it should have button 'create'" do
      visit '/index' 
      expect(page).to have_content('Create')
    end
  end
end
