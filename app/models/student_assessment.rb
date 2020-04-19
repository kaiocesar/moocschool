class StudentAssessment < ApplicationRecord
  belongs_to :assessment
  belongs_to :enrollment

  validates :weight, presence: true
end
