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


# TODO: update after reservation action is created.
  # after_create :reminder
  #
  # def reminder
  #   account_sid = ENV["twilio_account_sid"]
  #   auth_token = ENV["twilio_auth_token"]
  #   to = "1 #{self.user.phone_number}"
  #   from = ENV["twilio_phone_number"]
  #   time = self.time_slot.time[0..1].to_i < 12 ? "#{self.time_slot.time} am" : self.time_slot.time
  #   doctor_name = "#{doctor.salutation} #{doctor.first_name} #{doctor.last_name}"
  #   patient_names = patients.map { |patient| "#{patient.first_name} #{patient.last_name}" }.join(" and ")
  #   notes = self.notes.nil? ? "" :
  #   "\n\nYou left the following notes:\n\n#{self.notes}"
  #   message = "Hello,\nthis is a kind reminder for your appointment for #{patient_names} at #{time} on #{self.time_slot.appointment_date.appointment_date} with #{doctor_name} #{notes}"
  #   @client = Twilio::REST::Client.new(account_sid, auth_token)
  #   sms = @client.account.messages.create({
  #       :to => to,
  #       :from => from,
  #       :body => message
  #   })
  #   puts sms.to
  # end

  def guests_count
    users.count
  end
end
