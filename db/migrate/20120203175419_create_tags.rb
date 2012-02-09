class CreateTags < ActiveRecord::Migration
  def self.up
    create_table :tags do |t|
	t.column :post_id, :integer
	t.column :name, :string, :null => false
    end
  end
   def down
	drop_table :tags 
   end
end
