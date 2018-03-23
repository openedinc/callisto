class DropCaliperEvents < ActiveRecord::Migration[5.1]
  def change
    drop_table :caliper_events
    remove_column :assessment_events, :caliper_event_id
    remove_column :assessment_item_events, :caliper_event_id
    remove_column :grade_events, :caliper_event_id
    remove_column :media_events, :caliper_event_id
  end
end
