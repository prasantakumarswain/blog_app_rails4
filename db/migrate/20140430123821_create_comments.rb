class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :name
      t.text :body
      t.integer :user_id
      t.integer :blog_id

      t.timestamps
    end
  end
end
