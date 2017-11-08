class User < ApplicationRecord
  has_secure_password

  validates :first_name, :last_name, presence: true
  validates :password, presence: true, if: :password
  validates :email, presence: true, uniqueness: true

  enum role: ["teacher", "admin"]

  has_many :klasses, dependent: :destroy
  has_many :observations, dependent: :destroy

  def full_name
    "#{first_name} #{last_name}"
  end

  def students
    student_collections = klasses.includes(:students).map do |klass|
      klass.students
    end
    student_collections.flatten.uniq
  end

  def klass_names
    klasses.map do |klass|
      klass.title
    end
  end

  def self.from_oauth(auth)
    user = User.find_by(email: auth[:info][:email])
    if user
      attributes = {
        provider: auth[:provider],
        uid: auth[:uid],
        email: auth[:info][:email],
        first_name: auth[:info][:first_name],
        last_name: auth[:info][:last_name],
        token: auth[:credentials][:token],
        refresh_token: auth[:credentials][:refresh_token]
      }
      user.update(attributes)
      user
    else
      return false
    end
  end
end
