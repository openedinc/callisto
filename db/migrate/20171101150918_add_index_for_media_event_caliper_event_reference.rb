class AddIndexForMediaEventCaliperEventReference < ActiveRecord::Migration[5.0]
  disable_ddl_transaction!

  def change
  	add_index :media_events, :caliper_event_id, algorithm: :concurrently
  end
end
