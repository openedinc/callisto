class RemoveAssessmentEventsAndAssessmentItemEventsGeneratedIdIndexes < ActiveRecord::Migration[5.1]
  def change
    remove_index :assessment_events, :generated_id
    remove_index :assessment_item_events, :generated_id
  end
end
