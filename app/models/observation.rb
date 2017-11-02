class Observation < ApplicationRecord
  validates :comment, :date, :subject, :ob_type, presence: true

  belongs_to :student
  belongs_to :user
end
