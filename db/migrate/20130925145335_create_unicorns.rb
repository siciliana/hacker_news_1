class CreateUnicorns < ActiveRecord::Migration
  def change
    create_table :unicorns do |t|
      t.integer :post_vote, default: 0
      t.integer :post_id
      t.integer :user_id
      t.timestamps
    end 
  end
end
