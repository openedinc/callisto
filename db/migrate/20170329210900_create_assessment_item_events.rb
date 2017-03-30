class CreateAssessmentItemEvents < ActiveRecord::Migration[5.0]
  def change
    create_table :assessment_item_events do |t|
      t.string :actorId
      t.string :action
      t.string :objectId
      t.integer :maxScore
      t.string :isPartOf
      t.string :generatedId
      t.integer :generatedCount
      t.datetime :generatedStartedAtTime

      t.timestamps
    end
  end
end
