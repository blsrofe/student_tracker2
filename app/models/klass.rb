class Klass < ApplicationRecord

  validates :title, :school_year, :description, presence: true

  belongs_to :user
  has_many :klass_students, dependent: :destroy
  has_many :students, through: :klass_students, dependent: :destroy
end
