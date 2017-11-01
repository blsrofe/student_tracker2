class Student < ApplicationRecord
  validates :first_name, :last_name, :grade_level, presence: true
  validates :email, presence: true, uniqueness: true

  has_many :klass_students
  has_many :klasses, through: :klass_students
end
