class RemoveTaskmasterIdFromTasks < ActiveRecord::Migration
  def change
    remove_column :tasks, :taskmaster_id
  end
end
