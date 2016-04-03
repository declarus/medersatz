class ApplicationController < ActionController::API
  include ApplicationHelper
  include Authenticable

  def authenticate_user!
    unless current_user
      head :unauthorized
      return
    end
  end
end
