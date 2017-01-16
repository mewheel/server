class RemoveSkillsFromActivities < ActiveRecord::Migration[5.0]
  def change
    remove_reference :activities, :skills
  end
end
