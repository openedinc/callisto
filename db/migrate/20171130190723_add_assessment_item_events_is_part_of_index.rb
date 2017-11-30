class AddAssessmentItemEventsIsPartOfIndex < ActiveRecord::Migration[5.0]
  disable_ddl_transaction!

  def change
    add_index :assessment_item_events, :is_part_of, algorithm: :concurrently
  end
end
