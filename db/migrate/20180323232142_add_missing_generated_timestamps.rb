class AddMissingGeneratedTimestamps < ActiveRecord::Migration[5.1]
  def change
    add_column :assessment_events, :generated_started_at_time, :datetime
    add_column :assessment_item_events, :generated_ended_at_time, :datetime

    add_column :media_events, :generated_started_at_time, :datetime
    add_column :media_events, :generated_ended_at_time, :datetime

    add_column :grade_events, :generated_started_at_time, :datetime
    add_column :grade_events, :generated_ended_at_time, :datetime
  end
end
