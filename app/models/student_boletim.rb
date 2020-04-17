class StudentBoletim < ApplicationRecord
  belongs_to :enrollment
  belongs_to :grid

  validates :weight, presence: true
end
