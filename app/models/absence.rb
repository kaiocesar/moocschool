class Absence < ApplicationRecord
  belongs_to :grid
  belongs_to :enrollment
end
