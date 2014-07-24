class User < ActiveRecord::Base
  # has_many :created_tasks, foreign_key: "user_id", class_name: "Task"
  # has_many :assigned_tasks, foreign_key: "recipient_id", class_name: "Task"
  has_many :recipients
  has_many :tasks
end
