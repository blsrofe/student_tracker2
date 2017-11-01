class Klass < ApplicationRecord

  validates :title, :school_year, :description, presence: true
  
  belongs_to :user
  belongs_to :student
end
