class Teacher < ApplicationRecord
    has_many :grid

    validates :name, :cpf, presence: true
end
