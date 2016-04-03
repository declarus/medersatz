require 'rails_helper'

RSpec.describe Api::V1::SessionsController, :type => :controller do


  describe "POST #create" do
    let!(:user) { User.create(email: 'test@example.com', password: 'password', password_confirmation: 'password') }

    context "when the credentials are correct" do

      before(:each) do
        credentials = { email: user.email, password: 'password' }
        post :create, params: { session: credentials }
      end

      it "returns the user record corresponding to the given credentials" do
        user.reload
        expect(json_response['auth_token']).to eql user.auth_token
      end

      it { should respond_with 200 }
    end

    context "when the credentials are incorrect" do

      before(:each) do
        credentials = { email: user.email, password: "invalidpassword" }
        post :create, params: { session: credentials }
      end

      it "returns a json with an error" do
        expect(json_response['errors']).to eql "Invalid email or password"
      end

      it { should respond_with 422 }
    end
  end

  describe "DELETE #destroy" do
    let!(:user) { User.create(email: 'test@example.com', password: 'password', password_confirmation: 'password') }

    before(:each) do
      credentials = { email: user.email, password: 'password' }
      post :create, params: { session: credentials }
      user.reload
      delete :destroy, params: { id: user.auth_token }
    end

    it { should respond_with 204 }

  end

  def json_response
    JSON.parse(response.body)
  end

  # describe "POST create" do
  #   it "returns http success" do
  #     User.create(email: 'test@example.com', password: 'password', password_confirmation: 'password')
  #     post :create, params: { session: { email: 'test@example.com', password: 'password', password_confirmation: 'password' } }
  #     expect(response).to have_http_status(:success)
  #   end

  #   it "returns head unauthorized" do
  #     post :create, params: { session: { email: 'test@example.com', password: 'password', password_confirmation: 'password' } }
  #     expect(response).to have_http_status(:unauthorized)
  #   end
  # end

  # xdescribe "DELETE destroy" do
  #   it "returns http success" do
  #     delete :destroy
  #     expect(response).to have_http_status(:success)
  #   end
  # end
end
