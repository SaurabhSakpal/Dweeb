class CreateInterests < ActiveRecord::Migration
  def self.up
    create_table :interests do |t|
	t.column :name, :string
	t.column :user_id, :integer
      t.timestamps
    end
	add_index :users, :email, :unique => true
  end
  def self.down
	drop_table :interests
	remove_index :users, :email
  end

end
