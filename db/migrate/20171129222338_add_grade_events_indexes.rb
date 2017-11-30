class AddGradeEventsIndexes < ActiveRecord::Migration[5.0]
  disable_ddl_transaction!

  def change
    add_index :grade_events, :actor_id, algorithm: :concurrently
    add_index :grade_events, :object_id, algorithm: :concurrently
    add_index :grade_events, :assignable_id, algorithm: :concurrently
  	add_index :grade_events, :generated_id, algorithm: :concurrently
  end
end
