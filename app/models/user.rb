class User < ApplicationRecord
  validates :first_name, :last_name, presence: true
  validates :email, presence: true, uniqueness: true

  enum role: ["teacher", "admin", "guardian"]
end
