class Absence < ApplicationRecord
  belongs_to :grid
  belongs_to :enrollment

  validates :data_absence, :status, presence: true
end
