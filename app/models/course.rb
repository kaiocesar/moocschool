class Course < ApplicationRecord
    validates :name, :tritation, :amount_periods, :workload, presence: true
    has_one_attached :cover
end
