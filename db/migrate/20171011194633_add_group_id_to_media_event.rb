class AddGroupIdToMediaEvent < ActiveRecord::Migration[5.0]
  def change
  	add_column :media_events, :group_id, :string
  end
end
