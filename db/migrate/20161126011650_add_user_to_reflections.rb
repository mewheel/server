class AddUserToReflections < ActiveRecord::Migration[5.0]
  def change
    add_reference :reflections, :user, foreign_key: true
  end
end
