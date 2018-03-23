class DropGeneratedIdIndex < ActiveRecord::Migration[5.1]
  disable_ddl_transaction!

  def change
    remove_index :assessment_events, :generated_id
    remove_index :assessment_item_events, :generated_id
    remove_index :grade_events, :generated_id

    add_index :assessment_events, :generated_id
    add_index :assessment_item_events, :generated_id
    add_index :grade_events, :generated_id
  end
end
