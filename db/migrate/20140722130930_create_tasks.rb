class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :activity
      t.boolean :completed
      t.date :complete_date
      t.text :message
      t.integer :tasker_id

      t.timestamps
    end
  end
end
