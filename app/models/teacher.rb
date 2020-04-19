class Teacher < ApplicationRecord
    has_many :grid
    validates :name, :cpf, cpf: {mask: true}, presence: true
end
