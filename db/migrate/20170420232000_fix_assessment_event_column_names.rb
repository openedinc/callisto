class FixAssessmentEventColumnNames < ActiveRecord::Migration[5.0]
  def change
    rename_column :assessment_events, :actorId,:actor_id
    rename_column :assessment_events, :objectId, :object_id
    rename_column :assessment_events, :generatedId, :generated_id
    rename_column :assessment_events, :generatedEndedAtTime, :generated_ended_at_time

  end
end
