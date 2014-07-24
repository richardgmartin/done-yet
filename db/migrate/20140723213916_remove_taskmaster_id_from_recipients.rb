class RemoveTaskmasterIdFromRecipients < ActiveRecord::Migration
  def change
    remove_column :recipients, :taskmaster_id
  end
end
