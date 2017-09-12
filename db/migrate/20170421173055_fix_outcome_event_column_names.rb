class FixOutcomeEventColumnNames < ActiveRecord::Migration[5.0]
  def change
    rename_column :outcome_events, :actorId,:actor_id
    rename_column :outcome_events, :objectId, :object_id
    rename_column :outcome_events, :assignableId, :assignable_id
    rename_column :outcome_events, :assignableMaxScore, :assignable_max_score
    rename_column :outcome_events, :assignableIsPartOf, :assignable_is_part_of
    rename_column :outcome_events, :generatedId, :generated_id
    rename_column :outcome_events, :generatedTotalScore, :generated_total_score
    rename_column :outcome_events, :generatedScoredBy, :generated_scored_by
  end
end
