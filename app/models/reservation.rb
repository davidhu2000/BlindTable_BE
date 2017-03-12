# == Schema Information
#
# Table name: reservations
#
#  id                  :integer          not null, primary key
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  rid                 :string           not null
#  confirmation_number :string           not null
#

class Reservation < ApplicationRecord
  validates :confirmation_number, :rid, presence: true

  has_many :reservation_joins
  has_many :users, through: :reservation_joins, source: :user

  attr_reader :guests_count

  def guests_count
    users.count
  end
end
