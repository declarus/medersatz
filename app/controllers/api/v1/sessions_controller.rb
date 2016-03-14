module Api
  module V1
    class Api::V1::SessionsController < ApplicationController
      def create
        user = User.find_by(email: session_params[:email].downcase)
        if user && user.authenticate(session_params[:password])
          log_in(user.id)
          render_json true
        else
          render_json user.errors
        end
      end

      def destroy
        log_out
        render_json true
      end

      private
      def session_params
        params.require(:session).permit(:email, :password, :password_confirmation)
      end
    end
  end
end
