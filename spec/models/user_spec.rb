require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    # validation examples here
    it "should have all fields present" do
      user = User.create(
        name: "Valentino Rossi",
        email: "theDoctor@gmail.com",
        password: "gottaBlast",
        password_confirmation: "gottaBlast")
      expect(user).to be_valid
    end

     it "should have case sensitive matching passwords" do
      user = User.create(
        name: "Valentino Rossi",
        email: "theDoctor@gmail.com",
        password: "gottaBlast",
        password_confirmation: "gottablast")
      expect(user).to_not (be_valid)
    end

      it "should have unique emails" do
      user = User.create(
        name: "Valentino Rossi",
        email: "theDoctor@gmail.com",
        password: "gottaBlast",
        password_confirmation: "gottablast")

      user2 = User.create(
       name: "Marc Márquez",
        email: "theDoctor@gmail.com",
        password: "Vroom",
        password_confirmation: "Vroom")

      expect(user2).to be_valid
    end

      it "should have a password be min length of 3" do
      user = User.create(
        name: "Fabio Quartararo",
        email: "TeamYamaha@gmail.com",
        password: "12",
        password_confirmation: "12"
      )
      expect(user).to_not be_valid
      expect(user.errors.full_messages).to include 'Password is too short (minimum is 3 characters)'
    end
    
    describe 'Authenticate_with_credentials' do
    it "should authenticate" do
      user = User.create(
        name: "test",
        email: "test@example.com",
        password: "1234",
        password_confirmation: "1234"
      )
    authenticate = User.authenticate_with_credentials(user.email, user.password)
    expect(authenticate).to_not (be_nil)
    end
  end

  end
end
