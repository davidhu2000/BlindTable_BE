# == Schema Information
#
# Table name: reservations
#
<<<<<<< HEAD
#  id                  :integer          not null, primary key
#  rid                 :string           not null
#  confirmation_number :string           not null
#  party_size          :integer          not null
#  first_name          :string           not null
#  last_name           :string           not null
#

class Reservation < ApplicationRecord
  validates :rid, :party_size, :first_name, :last_name, :confirmation_no, presence: true
=======
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
>>>>>>> 1faf192303306ed68602bbc256eafac4aa443665
end
