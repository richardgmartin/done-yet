class AddScheduleTimeToTask < ActiveRecord::Migration
  def change
    add_column :tasks, :schedule_time, :datetime
  end
end
