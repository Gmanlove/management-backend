class Teacher < ApplicationRecord
    belongs_to :school
    belongs_to :position
    belongs_to :qualification
  
    has_many :school_classes
  end
  