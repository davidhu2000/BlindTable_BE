# == Schema Information
#
# Table name: reservations
#
#  id                  :integer          not null, primary key
#  rid                 :string           not null
#  confirmation_number :string           not null
#  party_size          :integer          not null
#  first_name          :string           not null
#  last_name           :string           not null
#

class Reservation < ApplicationRecord
  validates :rid, :party_size, :first_name, :last_name, :confirmation_no, presence: true
end
