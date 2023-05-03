class CreatePosts < ActiveRecord::Migration[7.0]
  def change
    create_table :posts do |t|
      t.string :title
      t.string :text
      t.integer :commrnts_counter, default: 0
      t.integer :linkes_counter, default: 0
      t.timestamps
    end
  end
end