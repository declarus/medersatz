require 'rails_helper'

RSpec.describe User, :type => :model do

  subject { User.create!(email: 'test@example.com', password: 'password', password_confirmation: 'password') }

  it { should respond_to(:auth_token) }
  it { should validate_uniqueness_of(:auth_token) }


  describe "#generate_authentication_token!" do
    let(:user) { User.new(email: 'test@example.com', password: 'password', password_confirmation: 'password') }

    subject { user.auth_token }

    it "generates a unique token" do
      SecureRandom.stub(:hex).and_return("auniquetoken123")
      user.generate_authentication_token!
      is_expected.to eql "auniquetoken123"
    end

    it "generates another token when one already has been taken" do
      existing_user = User.create!(auth_token: "auniquetoken123", email: 'test2@example.com', password: 'password', password_confirmation: 'password')
      user.generate_authentication_token!
      is_expected.not_to eql existing_user.auth_token
    end
  end
end
