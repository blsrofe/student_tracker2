class Observation < ApplicationRecord
  validates :comment, :date, :subject, :type, :parent_viewable, presence: true

  belongs_to :student
end
