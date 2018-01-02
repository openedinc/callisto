class AddAssessmentEventsAndAssessmentItemEventsGeneratedIdIndexes < ActiveRecord::Migration[5.1]
  disable_ddl_transaction!

  def change
    add_index :assessment_events, :generated_id, unique: true
    add_index :assessment_item_events, :generated_id, unique: true
  end
end
