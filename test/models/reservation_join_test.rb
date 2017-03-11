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

require 'test_helper'

class ReservationJoinTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
