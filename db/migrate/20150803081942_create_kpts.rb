class CreateKpts < ActiveRecord::Migration
  def change
    create_table :kpts do |t|
      t.string :keep
      t.string :problem
      t.string :try

      t.timestamps null: false
    end
  end
end
