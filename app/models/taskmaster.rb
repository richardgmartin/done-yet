class Taskmaster < ActiveRecord::Base
  has_many :taskers
  has_many :tasks, through: :taskers
end
