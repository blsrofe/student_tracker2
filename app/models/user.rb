class User < ApplicationRecord
  has_secure_password

  validates :first_name, :last_name, :password, presence: true
  validates :email, presence: true, uniqueness: true

  enum role: ["teacher", "admin", "guardian"]

  has_many :klasses, dependent: :destroy
  has_many :observations, dependent: :destroy

  def full_name
    "#{first_name} #{last_name}"
  end

  def students
    klasses.first.students.map do |student|
      student.full_name
    end
  end

  def klass_names
    klasses.map do |klass|
      klass.title
    end
  end
end
