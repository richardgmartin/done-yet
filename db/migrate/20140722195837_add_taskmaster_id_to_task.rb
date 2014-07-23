class AddTaskmasterIdToTask < ActiveRecord::Migration
  def change
    add_column :tasks, :taskmaster_id, :integer
  end
end
