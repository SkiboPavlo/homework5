class CreateEventsAndUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :events_users do |t|
      t.belongs_to :event, index: true
      t.belongs_to :user, index: true
    end

    remove_column :users, :event_id
    rename_column :events, :user_id, :comment_id
  end
end
