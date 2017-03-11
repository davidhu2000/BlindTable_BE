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

require 'test_helper'

class ReservationTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
