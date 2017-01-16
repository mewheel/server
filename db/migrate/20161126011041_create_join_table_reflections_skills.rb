class CreateJoinTableReflectionsSkills < ActiveRecord::Migration[5.0]
  def change
    create_join_table :reflections, :skills do |t|
      t.index [:reflection_id, :skill_id]
    end
  end
end
