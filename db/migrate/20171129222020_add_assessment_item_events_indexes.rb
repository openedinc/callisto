class AddAssessmentItemEventsIndexes < ActiveRecord::Migration[5.0]
  disable_ddl_transaction!

  def change
    add_index :assessment_item_events, :actor_id, algorithm: :concurrently
    add_index :assessment_item_events, :object_id, algorithm: :concurrently
    add_index :assessment_item_events, :generated_id, algorithm: :concurrently
    add_index :assessment_item_events, :group_id, algorithm: :concurrently
  end
end
