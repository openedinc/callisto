class CreateForwards < ActiveRecord::Migration[5.0]
  def change
    create_table :forwards do |t|
      t.boolean :active
      t.string :endpoint

      t.timestamps
    end
  end
end
