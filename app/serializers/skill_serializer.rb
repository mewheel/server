class SkillSerializer < ActiveModel::Serializer
  attributes :id,
             :name,
             :desc,
             :created_at,
             :updated_at
end
