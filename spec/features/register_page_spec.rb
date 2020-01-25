require 'rails_helper'

RSpec.describe "Register" do
    it "works with valid credentials" do
        visit root_path
        fill_in("Name", options={:id=>'user_name',:with=>"John Doe"})
        fill_in("Email", options = {:id => 'user_email', :with =>"a@g.com"})
        fill_in("Password", options = {:id => 'user_password', :with =>"qwerty"})
        fill_in("Password confirmation", options={:id =>'user_password_confirmation',:with=>'qwerty'})
        click_button'Submit'
        expect(page).to have_text("User Successfully Registered")
    end
    it "does not work when email is missing" do
        visit root_path
        fill_in("Name", options={:id=>'user_name',:with=>"John Doe"})
        fill_in("Password", options = {:id => 'user_password', :with =>"qwerty"})
        fill_in("Password confirmation", options={:id =>'user_password_confirmation',:with=>'qwerty'})
        click_button'Submit'
        expect(page).to have_text("Email can't be blank")
        expect(page).to have_text("Email is invalid")
    end
    it "does not work when email is missing" do
        visit root_path
        fill_in("Name", options={:id=>'user_name',:with=>"John Doe"})
        fill_in("Email", options = {:id => 'user_email', :with =>"a@gcom"})
        fill_in("Password", options = {:id => 'user_password', :with =>"qwerty"})
        fill_in("Password confirmation", options={:id =>'user_password_confirmation',:with=>'qwerty'})
        click_button'Submit'
        expect(page).to have_text("Email is invalid")
    end
    it "does not work when name is missing" do
        visit root_path
        fill_in("Email", options = {:id => 'user_email', :with =>"a@gcom"})
        fill_in("Password", options = {:id => 'user_password', :with =>"qwerty"})
        fill_in("Password confirmation", options={:id =>'user_password_confirmation',:with=>'qwerty'})
        click_button'Submit'
        expect(page).to have_text("Name can't be blank")
    end
    it "does not work when password is missing" do
        visit root_path
        fill_in("Name", options={:id=>'user_name',:with=>"John Doe"})
        fill_in("Email", options = {:id => 'user_email', :with =>"a@g.com"})
        fill_in("Password confirmation", options={:id =>'user_password_confirmation',:with=>'qwerty'})
        click_button'Submit'
        expect(page).to have_text("Password digest can't be blank")
        expect(page).to have_text("Password can't be blank")
    end
    it "does not work when passwords mismatch" do
        visit root_path
        fill_in("Name", options={:id=>'user_name',:with=>"John Doe"})
        fill_in("Email", options = {:id => 'user_email', :with =>"a@g.com"})
        fill_in("Password", options = {:id => 'user_password', :with =>"qwerty"})
        fill_in("Password confirmation", options={:id =>'user_password_confirmation',:with=>'qwert'})
        click_button'Submit'
        expect(page).to have_text("Password confirmation doesn't match Password")
    end
end