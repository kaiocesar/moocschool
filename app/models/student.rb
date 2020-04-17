class Student < ApplicationRecord
    has_many :enrollment # tem muitas matriculas "ativas"
    
    validates :name, :cpf, presence: true
end
