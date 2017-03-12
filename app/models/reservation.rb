# == Schema Information
#
# Table name: reservations
#
#  id         :integer          not null, primary key
#  name       :string           not null
#  address    :string           not null
#  state      :string           not null
#  city       :string           not null
#  zip        :string           not null
#  time       :time             not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Reservation < ApplicationRecord
  validates :name, :address, :state, :city, :zip, :time, presence: true

  has_many :reservation_joins
  has_many :users, through: :reservation_joins, source: :user

  attr_reader :guests_count

  def guests_count
    users.count
  end
end
