class CreateActivities < ActiveRecord::Migration[5.0]
  def change
    create_table :activities do |t|
      t.string :name
      t.string :desc
      t.belongs_to :skills
      t.timestamps
    end
  end
end
