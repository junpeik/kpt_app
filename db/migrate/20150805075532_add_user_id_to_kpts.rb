class AddUserIdToKpts < ActiveRecord::Migration
  def change
    add_column :kpts, :user_id, :integer
    add_index :kpts, [:user_id, :created_at]
  end
end
