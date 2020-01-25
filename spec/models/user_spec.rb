require 'rails_helper'

RSpec.describe "User" do
    it "is valid with valid attributes" do
        u=User.new(name:"John Doe",email:"a@g.com",password:"password")
        expect(u).to be_valid
    end
    it "is not valid with non-unique email" do
        u=User.new(name:"John Doe",email:"a@g.com",password:"password")
        u.save
        u=User.new(name:"John Doe",email:"a@g.com",password:"password")
        expect(u).to_not be_valid
    end
end