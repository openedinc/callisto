class AddGeneratedScoreToAssessmentItemEvent < ActiveRecord::Migration[5.0]
  def change
    add_column :assessment_item_events, :generated_score, :float
  end
end
