# == Schema Information
#
# Table name: users
#
#  id            :integer          not null, primary key
#  image_url     :string           not null
#  description   :text             not null
#  first_name    :string           not null
#  last_name     :string           not null
#  phone_number  :integer          not null
#  session_token :string           not null
#  authy_id      :string           not null
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
