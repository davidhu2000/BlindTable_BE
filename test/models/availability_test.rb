# == Schema Information
#
# Table name: availabilities
#
#  id               :integer          not null, primary key
#  radius           :integer          not null
#  party_size       :integer          default("4"), not null
#  forward_minutes  :integer          default("60"), not null
#  backward_minutes :integer          default("0"), not null
#  start_date_tiime :string           not null
#  longitude        :string           not null
#  latitude         :string           not null
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

require 'test_helper'

class AvailabilityTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
