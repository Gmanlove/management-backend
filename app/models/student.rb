class Student < ApplicationRecord
  belongs_to :school
  belongs_to :school_class
  belongs_to :section
end