class Reservation < ApplicationRecord
  validates :name, :address, :state, :city, :zip, :time, presence: true

  has_many :reservation_joins
  has_many :users, through: :reservation_joins, source: :user

  attr_reader :guests_count

  def guests_count
    users.count
  end
end
