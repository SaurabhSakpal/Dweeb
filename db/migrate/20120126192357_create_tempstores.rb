class CreateTempstores < ActiveRecord::Migration
def self.up
      create_table :tempstores do |t|
	t.column :email, :string
	t.column :password, :string     
    end
end

end
