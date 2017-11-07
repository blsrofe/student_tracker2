class Klass < ApplicationRecord

  validates :title, :school_year, :description, presence: true

  belongs_to :user
  has_many :enrollments, dependent: :destroy
  has_many :students, through: :enrollments, dependent: :destroy

end
