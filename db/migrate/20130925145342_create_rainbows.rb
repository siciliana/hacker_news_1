class CreateRainbows < ActiveRecord::Migration
  def change
    create_table :rainbows do |t|
      t.integer :comment_vote, default: 0 
      t.integer :comment_id
      t.integer :user_id
      t.timestamps
    end 
  end
end
