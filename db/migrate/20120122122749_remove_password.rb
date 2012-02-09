class RemovePassword < ActiveRecord::Migration
  def up
  remove_column :users,:password
  end

  def down
  add_coloumn :users, :password, :integer
  end
end
