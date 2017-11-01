class AddEventTimeColumnToParsedEventTables < ActiveRecord::Migration[5.0]
  def change
    add_column :assessment_events, :event_time, :datetime
    add_column :assessment_item_events, :event_time, :datetime
    add_column :media_events, :event_time, :datetime
    add_column :grade_events, :event_time, :datetime
  end
end
