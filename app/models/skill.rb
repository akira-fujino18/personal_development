class Skill < ApplicationRecord
  include ActiveModel::Dirty
belongs_to :user
has_many :categories
validates :name, presence: true
end