class RenameTaskmaster < ActiveRecord::Migration
  def change
    rename_table :taskmasters, :users
  end
end
