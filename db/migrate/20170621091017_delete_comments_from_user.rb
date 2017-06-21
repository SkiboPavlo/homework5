class DeleteCommentsFromUser < ActiveRecord::Migration[5.1]
  def change
    remove_column :events, :comments
  end
end
