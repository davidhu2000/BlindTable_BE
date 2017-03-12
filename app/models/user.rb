# == Schema Information
#
# Table name: users
#
#  id            :integer          not null, primary key
#  image_url     :string           not null
#  description   :text             not null
#  first_name    :string           not null
#  last_name     :string           not null
#  phone_number  :string           not null
#  session_token :string           not null
#  authy_id      :string           not null
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class User < ApplicationRecord
  validates :image_url, :description, :first_name, :last_name, :phone_number, :session_token, presence: true

  validates :phone_number, length: { is: 10, :message => "%{value} is not valid" }

  has_many :reservation_joins
  has_many :reservations, through: :reservation_joins, source: :reservation

  after_initialize :ensure_session_token!, :generate_authy

  def generate_session_token
    SecureRandom.urlsafe_base64(16)
  end

  def generate_authy
    self.authy_id ||= rand(100000..999999)
  end

  def reset_session_token!
    self.session_token = generate_session_token
    self.save!
    self.session_token
  end

  def reset_authy!
    self.authy_id = generate_authy
    self.save!
    self.authy_id
  end

  private

  def ensure_session_token!
    self.session_token ||= generate_session_token
  end
end
