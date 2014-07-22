class CreateTaskers < ActiveRecord::Migration
  def change
    create_table :taskers do |t|
      t.string :name
      t.string :phone
      t.integer :taskmaster_id

      t.timestamps
    end
  end
end
