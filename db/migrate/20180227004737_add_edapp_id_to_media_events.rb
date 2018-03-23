class AddEdappIdToMediaEvents < ActiveRecord::Migration[5.1]
  def change
    add_column :media_events, :edapp_id, :string
  end
end
