class Student < ApplicationRecord
  validates :first_name, :last_name, :grade_level, presence: true
  validates :email, presence: true, uniqueness: true

  has_many :klasses
  has_many :users, through: :klasses
end
