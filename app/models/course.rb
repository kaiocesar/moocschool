class Course < ApplicationRecord
    has_many :discipline
    has_many :classroom
    
    validates :name, :titration, :amount_periods_months, :workload, presence: true
    has_one_attached :cover
end
