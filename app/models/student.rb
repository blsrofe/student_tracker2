class Student < ApplicationRecord
  validates :first_name, :last_name, :grade_level, presence: true
  validates :email, presence: true, uniqueness: true
end
