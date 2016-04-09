module Api
  module V1
    class UsersController < ApplicationController
      before_action :authenticate_user!, except: [:create]
      before_action :set_user, only: [:show, :destroy]
      # before_action :only_yourself, except: [:index, :show, :create]

      # GET /api/v1/users
      def index
        @users = User.all

        render json: @users
      end

      # GET /api/v1/users/1
      def show
        render json: @user
      end

      # POST /api/v1/users
      def create
        @user = User.new(user_params)

        if @user.save
          render json: @user, status: :created
        else
          render json: @user.errors, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /api/v1/users/1
      def update
        @user = current_user
        if @user.update(user_params)
          render json: { id: @user.id, email: @user.email, auth_token: @user.auth_token }
        else
          render json: @user.errors, status: :unprocessable_entity
        end
      end

      # DELETE /api/v1/users/1
      def destroy
        @user.destroy
      end

      private
        # Use callbacks to share common setup or constraints between actions.
        def set_user
          @user = User.select(:id, :email, :auth_token).find(params[:id])
        end

        # Only allow a trusted parameter "white list" through.
        def user_params
          params.require(:user).permit(:email, :password, :password_confirmation)
        end

        def only_yourself
          return false if @user.id != current_user.id
          return true
        end
    end
  end
end
