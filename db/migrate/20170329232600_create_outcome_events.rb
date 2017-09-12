class CreateOutcomeEvents < ActiveRecord::Migration[5.0]
  def change
    create_table :outcome_events do |t|
      t.string :actorId
      t.string :action
      t.string :objectId
      t.string :assignableId
      t.integer :assignableMaxScore
      t.string :assignableIsPartOf
      t.string :generatedId
      t.integer :generatedTotalScore
      t.string :generatedScoredBy

      t.timestamps
    end
  end
end
