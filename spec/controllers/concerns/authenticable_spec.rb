require 'rails_helper'

class Authentication
  include Authenticable

  def request
  end

  # def response_code
  # end

  # def body
  # end

  def response
  end
end

describe Authenticable do
  let!(:user) { User.create(email: 'test@example.com', password: 'password', password_confirmation: 'password') }
  let(:authentication) { Authentication.new }
  subject { authentication }

  describe "#current_user" do
    before do
      request.headers["Authorization"] = user.auth_token
      authentication.stub(:request).and_return(request)
    end
    it "returns the user from the authorization header" do
      expect(authentication.current_user.auth_token).to eql user.auth_token
    end
  end

  describe "#authenticate_with_token" do
    let!(:user) { User.create(email: 'test@example.com', password: 'password', password_confirmation: 'password') }

    before do
      authentication.stub(:current_user).and_return(nil)
      response.stub(:response_code).and_return(401)
      response.stub(:body).and_return({"errors" => "Not authenticated"}.to_json)
      authentication.stub(:response).and_return(response)
    end

    it "render a json error message" do
      expect(JSON.parse(response.body)['errors']).to eql "Not authenticated"
    end

    it {  should respond_with 401 }
  end
end