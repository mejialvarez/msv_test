class CreateBinaryTrees < ActiveRecord::Migration[5.2]
  def change
    create_table :binary_trees do |t|
      t.integer :nodes, array: true, null: false
      t.timestamps
    end
  end
end
