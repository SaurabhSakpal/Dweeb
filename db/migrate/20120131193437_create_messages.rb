class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.column :user_id , :integer
      t.column :sender, :integer
      t.column :msg , :string, :null => false
      t.column :status, :string
      t.timestamps
    end
  end
end
