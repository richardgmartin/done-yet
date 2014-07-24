class CreateRecipients < ActiveRecord::Migration
  def change
    create_table :recipients do |t|
      t.string :name
      t.string :phone
      t.integer :taskmaster_id
      t.string :email

      t.timestamps
    end
  end
end
