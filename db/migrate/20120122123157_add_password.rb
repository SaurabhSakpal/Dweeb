class AddPassword < ActiveRecord::Migration
  def up
  add_column :users ,:password, :string
  end

  def down
  remove_column :user, :password
  end
end
