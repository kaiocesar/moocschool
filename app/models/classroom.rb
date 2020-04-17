class Classroom < ApplicationRecord
  belongs_to :course
  has_many :enrollments
  
  validates :name, :start_year, :end_year, :period, presence: true
end
