class Student < ApplicationRecord
    has_many :enrollment # tem muitas matriculas "ativas"
    
    validates :name, :cpf, cpf: {mask: true}, presence: true
end
