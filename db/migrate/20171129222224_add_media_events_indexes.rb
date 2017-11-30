class AddMediaEventsIndexes < ActiveRecord::Migration[5.0]
  disable_ddl_transaction!

  def change
    add_index :media_events, :actor_id, algorithm: :concurrently
    add_index :media_events, :object_id, algorithm: :concurrently
    add_index :media_events, :group_id, algorithm: :concurrently
  end
end
