class AddColumnToEvent < ActiveRecord::Migration[5.1]
  def change
    add_column :events, :comment, :string
  end
end
