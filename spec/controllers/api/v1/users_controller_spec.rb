require 'rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

RSpec.describe Api::V1::UsersController, :type => :controller do

  # This should return the minimal set of attributes required to create a valid
  # Api::V1::User. As you add validations to Api::V1::User, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    skip("Add a hash of attributes valid for your model")
  }

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
  }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # Api::V1::UsersController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET index" do
    it "assigns all api_v1_users as @api_v1_users" do
      user = Api::V1::User.create! valid_attributes
      get :index, {}, valid_session
      expect(assigns(:api_v1_users)).to eq([user])
    end
  end

  describe "GET show" do
    it "assigns the requested api_v1 as @api_v1" do
      user = Api::V1::User.create! valid_attributes
      get :show, {:id => user.to_param}, valid_session
      expect(assigns(:api_v1)).to eq(user)
    end
  end

  describe "GET new" do
    it "assigns a new api_v1 as @api_v1" do
      get :new, {}, valid_session
      expect(assigns(:api_v1)).to be_a_new(Api::V1::User)
    end
  end

  describe "GET edit" do
    it "assigns the requested api_v1 as @api_v1" do
      user = Api::V1::User.create! valid_attributes
      get :edit, {:id => user.to_param}, valid_session
      expect(assigns(:api_v1)).to eq(user)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Api::V1::User" do
        expect {
          post :create, {:api_v1 => valid_attributes}, valid_session
        }.to change(Api::V1::User, :count).by(1)
      end

      it "assigns a newly created api_v1 as @api_v1" do
        post :create, {:api_v1 => valid_attributes}, valid_session
        expect(assigns(:api_v1)).to be_a(Api::V1::User)
        expect(assigns(:api_v1)).to be_persisted
      end

      it "redirects to the created api_v1" do
        post :create, {:api_v1 => valid_attributes}, valid_session
        expect(response).to redirect_to(Api::V1::User.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved api_v1 as @api_v1" do
        post :create, {:api_v1 => invalid_attributes}, valid_session
        expect(assigns(:api_v1)).to be_a_new(Api::V1::User)
      end

      it "re-renders the 'new' template" do
        post :create, {:api_v1 => invalid_attributes}, valid_session
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested api_v1" do
        user = Api::V1::User.create! valid_attributes
        put :update, {:id => user.to_param, :api_v1 => new_attributes}, valid_session
        user.reload
        skip("Add assertions for updated state")
      end

      it "assigns the requested api_v1 as @api_v1" do
        user = Api::V1::User.create! valid_attributes
        put :update, {:id => user.to_param, :api_v1 => valid_attributes}, valid_session
        expect(assigns(:api_v1)).to eq(user)
      end

      it "redirects to the api_v1" do
        user = Api::V1::User.create! valid_attributes
        put :update, {:id => user.to_param, :api_v1 => valid_attributes}, valid_session
        expect(response).to redirect_to(user)
      end
    end

    describe "with invalid params" do
      it "assigns the api_v1 as @api_v1" do
        user = Api::V1::User.create! valid_attributes
        put :update, {:id => user.to_param, :api_v1 => invalid_attributes}, valid_session
        expect(assigns(:api_v1)).to eq(user)
      end

      it "re-renders the 'edit' template" do
        user = Api::V1::User.create! valid_attributes
        put :update, {:id => user.to_param, :api_v1 => invalid_attributes}, valid_session
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested api_v1" do
      user = Api::V1::User.create! valid_attributes
      expect {
        delete :destroy, {:id => user.to_param}, valid_session
      }.to change(Api::V1::User, :count).by(-1)
    end

    it "redirects to the api_v1_users list" do
      user = Api::V1::User.create! valid_attributes
      delete :destroy, {:id => user.to_param}, valid_session
      expect(response).to redirect_to(api_v1_users_url)
    end
  end

end
