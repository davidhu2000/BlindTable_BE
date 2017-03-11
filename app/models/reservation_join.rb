# == Schema Information
#
# Table name: reservation_joins
#
#  id             :integer          not null, primary key
#  reservation_id :integer          not null
#  user_id        :integer          not null
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

class ReservationJoin < ApplicationRecord
  validates :reservation_id, :user_id, presence: true

  belongs_to :user
  belongs_to :reservation
end
