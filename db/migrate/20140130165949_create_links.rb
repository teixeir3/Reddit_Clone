class CreateLinks < ActiveRecord::Migration
  def change
    create_table :links do |t|
      t.integer :sub_id, null: false
      t.string :title, null: false
      t.string :url, null: false
      t.integer :author_id, null: false
      t.text :text
      t.timestamps
    end

    add_index :links, :sub_id
    add_index :links, :author_id
  end
end
