class AddIndexToKpt < ActiveRecord::Migration
  def change
    add_index :kpts, :created_at
  end
end
