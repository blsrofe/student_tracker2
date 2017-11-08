class Parent < ApplicationRecord
  has_secure_password

  validates :first_name, :last_name, :phone_number, :password, presence: true
  validates :email, presence: true, uniqueness: true

  has_many :student_parents
  has_many :students, through: :student_parents

  def full_name
    "#{first_name} #{last_name}"
  end
end
