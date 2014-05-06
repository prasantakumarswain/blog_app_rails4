class AddPulishToBlogs < ActiveRecord::Migration
  def change
    add_column :blogs, :publish, :boolean
  end
end
