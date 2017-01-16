class ReflectionSerializer < ActiveModel::Serializer
  attributes :id,
             :body,
             :created_at,
             :updated_at
  has_many :skills

end
