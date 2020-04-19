class Course < ApplicationRecord
    has_many :discipline

    validates :name, :titration, :amount_periods_months, :workload, presence: true
    has_one_attached :cover
end
