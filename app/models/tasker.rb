class Tasker < ActiveRecord::Base
  has_many :tasks
  belongs_to :taskmaster
end
