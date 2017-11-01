class Student < ApplicationRecord
  validates :first_name, :last_name, :grade_level, presence: true
  validates :email, presence: true, uniqueness: true

  has_many :klass_students, dependent: :destroy
  has_many :klasses, through: :klass_students, dependent: :destroy
  
  def full_name
    "#{first_name} #{last_name}"
  end
end
