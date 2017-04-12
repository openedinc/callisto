class AddRoutedToCaliperEvents < ActiveRecord::Migration[5.0]
  def change
    add_column :caliper_events, :routed, :boolean
  end
end
