class StudentAssessment < ApplicationRecord
  belongs_to :assessment
  belongs_to :enrollment
end
