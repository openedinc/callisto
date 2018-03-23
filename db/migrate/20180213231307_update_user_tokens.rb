class UpdateUserTokens < ActiveRecord::Migration[5.1]
  def change
    change_column :users, :tokens, :json, default: {}
  end
end
