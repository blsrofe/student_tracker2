class Observation < ApplicationRecord
  validates :comment, :date, :subject, :ob_type, :parent_viewable, presence: true

  belongs_to :student
  belongs_to :user
end
