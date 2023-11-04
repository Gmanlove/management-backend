class Section < ApplicationRecord
  belongs_to :school_class
  has_many :students, through: :school_class
  has_many :teachers, through: :school_class

  validates :name, presence: true
  validates :name, uniqueness: true
 
end
