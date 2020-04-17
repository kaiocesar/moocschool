class StudentAssessment < ApplicationRecord
  belongs_to :assessment
  belongs_to :enrollment

  validates :name, :weight, presence: true
end
