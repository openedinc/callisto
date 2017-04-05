class CreateMediaEvents < ActiveRecord::Migration[5.0]
  def change
    create_table :media_events do |t|
      t.string :actor_id
      t.string :action
      t.string :object_id

      t.timestamps
    end
  end
end
