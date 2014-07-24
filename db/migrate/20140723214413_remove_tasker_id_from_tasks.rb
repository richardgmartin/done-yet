class RemoveTaskerIdFromTasks < ActiveRecord::Migration
  def change
    remove_column :tasks, :tasker_id
  end
end
