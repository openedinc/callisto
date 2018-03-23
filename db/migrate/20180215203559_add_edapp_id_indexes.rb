class AddEdappIdIndexes < ActiveRecord::Migration[5.1]
  disable_ddl_transaction!

  def change
    add_index :assessment_events, :edapp_id, algorithm: :concurrently
    add_index :assessment_item_events, :edapp_id, algorithm: :concurrently
    add_index :grade_events, :edapp_id, algorithm: :concurrently
  end
end
