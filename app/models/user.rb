class User < ApplicationRecord
  has_secure_password

  validates :first_name, :last_name, :password, presence: true
  validates :email, presence: true, uniqueness: true

  enum role: ["teacher", "admin", "guardian"]

  has_many :klasses, dependent: :destroy

  def full_name
    "#{first_name} #{last_name}"
  end
end
