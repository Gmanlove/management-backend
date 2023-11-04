class School < ApplicationRecord
  has_many :admins
  has_many :school_classes
  has_many :students, through: :school_classes
  has_many :teachers, through: :school_classes
  
  end