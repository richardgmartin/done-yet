class RemoveCompleteDateFromTask < ActiveRecord::Migration
  def change
    remove_column :tasks, :complete_date
  end
end
