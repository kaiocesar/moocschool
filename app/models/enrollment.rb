class Enrollment < ApplicationRecord
  belongs_to :student
  belongs_to :classroom

  validates :period, :status, presence: true

end
