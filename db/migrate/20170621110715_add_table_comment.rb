class AddTableComment < ActiveRecord::Migration[5.1]
  def change
    create_table :comments do |t|
      t.belongs_to :event, index: true
      t.string :description
    end
    remove_column :events, :comment
  end
end
