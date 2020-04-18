class Discipline < ApplicationRecord
  belongs_to :course
  
  validates :name, presence: true
end
