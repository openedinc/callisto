class CreateCaliperEvents < ActiveRecord::Migration[5.0]
  def change
    create_table :caliper_events do |t|
      t.jsonb :payload
      t.datetime :time

      t.timestamps
    end
  end
end
