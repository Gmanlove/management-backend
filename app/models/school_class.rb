class SchoolClass < ApplicationRecord
  belongs_to :school
  has_many :sections
end
