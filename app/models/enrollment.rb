class Enrollment < ApplicationRecord
  belongs_to :student
  belongs_to :classroom

  validates :period, :description, :status, presence: true

end
