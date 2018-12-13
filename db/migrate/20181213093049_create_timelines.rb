class CreateTimelines < ActiveRecord::Migration[5.2]
  def change
    create_table :timelines do |t|
      t.text :content
      t.references :user, foreign_key: true

      t.timestamps
    end
    add_index :timelines, [:user_id, :created_at]
  end
end
