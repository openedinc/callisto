class AddGeneratedAttemptIdToAssessmentItemEvent < ActiveRecord::Migration[5.1]
  def change
  	add_column :assessment_item_events, :generated_attempt_id, :string
  end
end
