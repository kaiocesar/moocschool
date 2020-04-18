class Period < ApplicationRecord
    validates :start_period, :end_period, :type_period, :day_of_class, presence: true
end
