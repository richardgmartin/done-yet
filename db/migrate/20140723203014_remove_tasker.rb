class RemoveTasker < ActiveRecord::Migration
  def change
    drop_table :taskers
  end
end
