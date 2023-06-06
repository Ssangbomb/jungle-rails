require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    it "is not valid without first name" do
      user = User.create(
        first_name: "",
        last_name: "Mars",
        email: "a@a.com",
        password: "1234",
        password_confirmation: "1234"
      )
      expect(user.errors.full_messages).to include("First name can't be blank")
      end 

    it "is not valid without last name" do
      user = User.create(
        first_name: "Jason",
        last_name: "",
        email: "a@a.com",
        password: "1234",
        password_confirmation: "1234"
      )
      expect(user.errors.full_messages).to include("Last name can't be blank")
    end 

    it "is not valid without email" do
      user = User.create(email: "")
      expect(user.errors.full_messages).to include("Email can't be blank")
    end 

    it "is not valid with camel case email" do
      user = User.create(email: "a@a.com")
      expect(user.email).not_to eql("A@A.com")
    end 

    it "checks if password and confirmation is not the same" do
      user = User.create(password: "1234", password_confirmation: "12"
      )
      expect(user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end      
  end

  describe '.authenticate_with_credentials' do
    # examples for this class method here
    it 'is valid user with uppercase email' do
      user = User.create(
        first_name: "Jason",
        last_name: "Mars",
        email: "a@a.com",
        password: "1234",
        password_confirmation: "1234"
      )
      
      expect(User.authenticate_with_credentials('A@A.com', '1234')).to eq(user)
    end
    it 'is valid user email with space' do
      user = User.create(
        first_name: "Jason",
        last_name: "Mars",
        email: "a@a.com",
        password: "1234",
        password_confirmation: "1234"
      )
      
      expect(User.authenticate_with_credentials(' a@a.com ', '1234')).to eq(user)
    end
  end
end
