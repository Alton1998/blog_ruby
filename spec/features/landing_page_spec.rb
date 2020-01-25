require 'rails_helper'

RSpec.describe "Landing Page" do
    it "has properly rendered" do
        visit root_path
        expect(page).to have_text("Register")
        expect(page).to have_text("Login")
        expect(page).to have_text("Name")
        expect(page).to have_text("Email")
        expect(page).to have_text("Password")
        expect(page).to have_text("Password confirmation")
        expect(page).to have_field("Name")
        expect(page).to have_field("Email")
        expect(page).to have_field("Password")
        expect(page).to have_field("Password confirmation")
        expect(page).to have_button('Submit')
        expect(page).to have_button('Login')
    end
end