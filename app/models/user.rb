class User < ApplicationRecord
  before_save { self.email = email.downcase }
  before_create :generate_authentication_token!

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 }, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }

  has_secure_password
  validates :password, length: { minimum: 6 }, if: :validate_password?
  validates :password_confirmation, presence: true, if: :validate_password?

  validates :auth_token, uniqueness: true

  def validate_password?
    password.present? || password_confirmation.present?
  end

  def generate_authentication_token!
    begin
      self.auth_token = SecureRandom.hex
    end while self.class.exists?(auth_token: auth_token)
  end
end
