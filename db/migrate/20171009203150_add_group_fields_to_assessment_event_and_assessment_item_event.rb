class AddGroupFieldsToAssessmentEventAndAssessmentItemEvent < ActiveRecord::Migration[5.0]
  def change
    add_column :assessment_events, :group_id, :string
    add_column :assessment_item_events, :group_id, :string
  end
end
