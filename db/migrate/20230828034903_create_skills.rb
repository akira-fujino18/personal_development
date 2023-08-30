class CreateSkills < ActiveRecord::Migration[7.0]
  def change
    create_table :skills do |t|
      t.integer :user_id, null: false, foreign_key: true
      t.integer :category_id, null: false, foreign_key: true
      t.integer :level, default: 40
      t.string :name
      t.timestamps
    end
  end
end
