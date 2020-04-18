class Course < ApplicationRecord
    validates :name, :tritation, :amount_periods, :workload, presence: true
end
