class AddEdappIdMediaEventsIndex < ActiveRecord::Migration[5.1]
  disable_ddl_transaction!

  def change
    add_index :media_events, :edapp_id, algorithm: :concurrently
  end
end
