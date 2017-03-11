# == Schema Information
#
# Table name: users
#
#  id            :integer          not null, primary key
#  image_url     :string           not null
#  description   :text             not null
#  first_name    :string           not null
#  last_name     :string           not null
#  phone_number  :integer          not null
#  session_token :string           not null
#  authy_id      :string           not null
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class User < ApplicationRecord
  validates :image_url, :description, :first_name, :last_name, :phone_number, :session_token, :authy_id, presence: true

  validates :phone_number, format: { with: /\d{3}-\d{3}-\d{4}/, message: "bad format" }, uniqueness: true

  def is_password?(password)
    BCrypt::Password.new(self.password_digest).is_password?(password)
  end

  def generate_session_token
    SecureRandom.urlsafe_base64(16)
  end

  def generate_authy
    rand(100000..999999)
  end

  def reset_session_token!
    self.session_token = generate_session_token
    self.save!
    self.session_token
  end

  def reset_authy!
    self.authy = generate_authy
    self.save!
    self.authy
  end

  private
  def ensure_session_token!
    self.session_token ||= generate_session_token
  end

  def ensure_authy!
    self.authy ||= generate_authy3
  end
end
