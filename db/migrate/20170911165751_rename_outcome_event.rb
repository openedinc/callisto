class RenameGradeEvent < ActiveRecord::Migration[5.0]
  def change
      rename_table :grade_events, :grade_events
  end
end
