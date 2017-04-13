class CreateAssessmentEvents < ActiveRecord::Migration[5.0]
  def change
    create_table :assessment_events do |t|
      t.string :actorId
      t.string :action
      t.string :objectId
      t.string :generatedId
      t.datetime :generatedEndedAtTime

      t.timestamps
    end
  end
end
