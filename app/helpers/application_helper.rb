module ApplicationHelper

  def log_in(user)
    user.generate_authentication_token!
    user.save
    user
  end

  def log_out(id)
    user = User.find_by(auth_token: id)
    user.generate_authentication_token!
    user.save
  end
end