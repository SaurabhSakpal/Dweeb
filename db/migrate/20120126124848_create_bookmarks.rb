class CreateBookmarks < ActiveRecord::Migration
  def self.up
    create_table :bookmarks do |t|
	t.column :user_id, :integer
	t.column :title, :string, :null => false
	t.column :desc, :string, :null => false
	t.column :url, :string, :null => false	
      t.timestamps
    end
  end

   def down
	drop_table :bookmarks 
   end
end
