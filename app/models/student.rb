class Student < ApplicationRecord
  validates :first_name, :last_name, :grade_level, presence: true
  validates :email, presence: true, uniqueness: true

  has_many :enrollments, dependent: :destroy
  has_many :klasses, through: :enrollments, dependent: :destroy
  has_many :observations, dependent: :destroy
  has_many :student_parents
  has_many :parents, through: :student_parents

  def full_name
    "#{first_name} #{last_name}"
  end
end
