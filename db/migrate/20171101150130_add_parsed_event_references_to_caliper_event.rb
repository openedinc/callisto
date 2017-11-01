class AddParsedEventReferencesToCaliperEvent < ActiveRecord::Migration[5.0]
  def change
    add_reference :assessment_events, :caliper_event, index: true
    add_reference :assessment_item_events, :caliper_event, index: true
    add_reference :grade_events, :caliper_event, index: true

    # Has a lot of records, will add index concurrently in a separate migration
    add_reference :media_events, :caliper_event, index: false
  end
end
