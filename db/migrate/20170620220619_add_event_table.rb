class AddEventTable < ActiveRecord::Migration[5.1]
  def change
    create_table :events do |t|
      t.string :name
      t.string :place
      t.datetime :date
      t.string :comments
      t.integer  :user_id
    end
  end
end
