class Task < ActiveRecord::Base
  belongs_to :recipient
  belongs_to :user
  after_create :schedule_sending_text
  before_save :change_run_at

  # has_one :job, foreign_key: 'delayed_job_id', class_name: 'Delayed::Job'
  # before_save :send_text_message
  # after_save :schedule_sending_text, on: [:create], :unless => :schedule_time_changed?

  def schedule_sending_text
    job = self.delay(run_at: self.schedule_time).send_text_message
    update_column(:delayed_job_id, job.id)
  end

  def change_run_at
    # delayed_job.run_at = schedule_time
    if schedule_time_changed? && !new_record?
      delayed_job.update_column(:run_at, schedule_time)
    end
  end

  def delayed_job
    Delayed::Job.find(delayed_job_id)
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
