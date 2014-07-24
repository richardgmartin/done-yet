class UserAndRecipientIdsToTasks < ActiveRecord::Migration
  def change
    add_column :tasks, :user_id, :integer
    add_column :tasks, :recipient_id, :integer
  end
end
