class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
	t.column :email, :string
	t.column :password, :string
	t.column :fname, :string
	t.column :lname, :string
	t.column :college, :string
	t.column :year, :string
	t.column :branch, :string
	t.column :validate, :string
        t.timestamps
    end
	
  end
  def self.down
	drop_table :users
  end
end




