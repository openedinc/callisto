class RenameOutcomeEvent < ActiveRecord::Migration[5.0]
  def change
      rename_table :outcome_events, :grade_events
  end
end
