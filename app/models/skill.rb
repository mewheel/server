class Skill < ApplicationRecord
  has_and_belongs_to_many :reflections
  has_many :activities
  belongs_to :user
end
