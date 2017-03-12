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

class Availability < ActiveResource::Base
  self.site = 'https://platform.otqa.com/availability'
  self.headers['Authorization'] = 'Bearer 27037c67-f394-4cfd-ab51-069ac71132fb'
  self.headers['Content-type'] = 'application/json'
end
