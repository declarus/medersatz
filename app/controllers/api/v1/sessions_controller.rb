module Api
  module V1
    class Api::V1::SessionsController < ApplicationController
      def create
        user = User.find_by(email: session_params[:email].downcase)
        if user && user.authenticate(session_params[:password])
          user = log_in(user)
          render json: user, status: 200, location: [:api, :v1, user]
        else
          render json: { errors: 'Invalid email or password' }, status: 422
        end
      end

      def destroy
        log_out(params[:id])
        head 204
      end

      private
      def session_params
        params.require(:session).permit(:email, :password, :password_confirmation)
      end
    end
  end
end
