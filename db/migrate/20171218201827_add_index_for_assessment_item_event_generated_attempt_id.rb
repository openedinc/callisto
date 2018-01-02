class AddIndexForAssessmentItemEventGeneratedAttemptId < ActiveRecord::Migration[5.1]
  disable_ddl_transaction!

  def change
    add_index :assessment_item_events, :generated_attempt_id, algorithm: :concurrently
  end
end
