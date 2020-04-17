class Grid < ApplicationRecord
  belongs_to :teacher
  belongs_to :discipline
  belongs_to :classroom
  belongs_to :period
end
