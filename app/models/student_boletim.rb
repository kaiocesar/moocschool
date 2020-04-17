class StudentBoletim < ApplicationRecord
  belongs_to :enrollment
  belongs_to :grid
end
