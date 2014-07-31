class AddDelayedJobIdToTask < ActiveRecord::Migration
  def change
    add_column :tasks, :delayed_job_id, :integer
  end
end
