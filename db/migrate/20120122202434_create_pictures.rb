class CreatePictures < ActiveRecord::Migration
  def self.up
    create_table :pictures do |t|
	t.column :user_id, :integer
	t.column :content_type, :string
	t.column :data, :binary, :limit => 1.megabyte
    end
  end
	def self.down
		drop_table :pictures
	end
end
