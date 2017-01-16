class Reflection < ApplicationRecord
  has_and_belongs_to_many :skills
  belongs_to :user
end
