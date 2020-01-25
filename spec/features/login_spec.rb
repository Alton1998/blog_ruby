require 'rails_helper'

RSpec.describe "Login" do
    it "works with valid credentials" do
        user=User.create(email:"a@g.com",name:"John Doe",password:"qwerty")
        visit root_path
        fill_in("Email", options = {:id => 'email', :with =>"a@g.com"})
        fill_in("Password", options = {:id => 'password', :with =>"qwerty"})
        click_button'Login'
        expect(current_path).to eq(blog_index_path)
    end
    it "does not work with invalid attributes" do
        visit root_path
        fill_in("Email", options = {:id => 'email', :with =>"a@g.com"})
        fill_in("Password", options = {:id => 'password', :with =>"qwerty"})
        click_button 'Login'
        expect(current_path).to eq(root_path)
        expect(page).to have_text("Email or Password maybe wrong")
    end
end