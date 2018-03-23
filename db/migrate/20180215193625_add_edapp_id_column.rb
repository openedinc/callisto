class AddEdappIdColumn < ActiveRecord::Migration[5.1]
  def change
    add_column :assessment_events, :edapp_id, :string
    add_column :assessment_item_events, :edapp_id, :string
    add_column :grade_events, :edapp_id, :string
  end
end
