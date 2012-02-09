class CreatePostTagJoinTable < ActiveRecord::Migration
  def self.up
    create_table :posts_tags, :id => false do |t|
      t.column :post_id , :integer
      t.column :tag_id , :integer
    end
	remove_column :tags, :post_id
  end
 
  def down
        drop_table :posts_tags
	add_column :tags, :post_id , :integer
  end
end
