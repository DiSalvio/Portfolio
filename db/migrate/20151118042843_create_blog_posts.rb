class CreateBlogPosts < ActiveRecord::Migration
  def change
    create_table :blog_posts do |t|      
      t.string :title
      t.text :content
      t.boolean :published, default: false

      t.timestamps null: false
    end
  end
end
