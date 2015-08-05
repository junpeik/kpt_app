class ChangeColumnToKpt < ActiveRecord::Migration
  #変更後
  def up
    change_column :kpts, :keep, :text
    change_column :kpts, :problem, :text
    change_column :kpts, :try, :text
  end

  #変更前
  def down
    change_column :kpts, :keep, :string
    change_column :kpts, :problem, :string
    change_column :kpts, :try, :string
  end
end
