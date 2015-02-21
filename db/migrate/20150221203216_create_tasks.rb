class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :title
      t.integer :user_id
      t.boolean :state

      t.timestamps
    end
  end
end
