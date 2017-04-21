class FixAssessmentItemEventColumnNames < ActiveRecord::Migration[5.0]
  def change

    rename_column :assessment_item_events, :actorId,:actor_id
    rename_column :assessment_item_events, :objectId, :object_id
    rename_column :assessment_item_events, :maxScore, :max_score
    rename_column :assessment_item_events, :isPartOf, :is_part_of
    rename_column :assessment_item_events, :generatedId, :generated_id
    rename_column :assessment_item_events, :generatedCount, :generated_count
    rename_column :assessment_item_events, :generatedStartedAtTime, :generated_started_at_time
  end
end
