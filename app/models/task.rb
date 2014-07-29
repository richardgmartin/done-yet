class Task < ActiveRecord::Base
  belongs_to :recipient
  belongs_to :user

  # before_save :send_text_message
  # after_save :schedule_sending_text, on: [:create], :unless => :schedule_time_changed?
  after_save :schedule_sending_text


  def schedule_sending_text
    self.delay(run_at: self.schedule_time).send_text_message
  end

  def send_text_message
    number_to_send_to = recipient.phone

    twilio_sid = ENV["TWILIO_ACCOUNT_SID"]
    twilio_token = ENV["TWILIO_AUTH_TOKEN"]
    twilio_phone_number = ENV["TWILIO_PHONE_NUMBER"]

    @twilio_client = Twilio::REST::Client.new twilio_sid, twilio_token

    @twilio_client.account.sms.messages.create(
      :from => "+1#{twilio_phone_number}",
      :to => number_to_send_to,
      :body => message
    )
  end

end
