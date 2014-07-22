class Task < ActiveRecord::Base
  belongs_to :tasker
  belongs_to :taskmaster
end
