#======================================
#   CRIAR UM USUÁRIO
#======================================
usuario_professor = User.create(
    email: Faker::Internet.email,
    password: "123456789",
    password_confirmation: "123456789"
)

usuario_estudante = User.create(
    email: Faker::Internet.email,
    password: "123456789",
    password_confirmation: "123456789"
)

#======================================
#   CRIAR UM CURSO
#======================================
curso_php = Course.create(
    name: "Desenvolvimento de #{Faker::ProgrammingLanguage.name}",
    titration: "técnico",
    amount_periods_months: "10", 
    workload: "360", # corrigir o sentido desse campo
    status: true
)

#======================================
#   CRIAR DISCIPLINAS PARA O CURSO
#======================================
logica_programacao = curso_php.discipline.create(
    name: "Lógica de programação" # Se algum curso mudar disciplina no futuro, isso irá alterar a grade dos cursos existente.
)

#======================================
#   CADASTRAR ALGUNS PROFESSORES
#======================================
professora_tina = usuario_professor.teacher.create(
    name: Faker::Name.name,
    cpf: "#{rand(999)}.#{rand(999)}.#{rand(999)}-#{rand(99)}", # aplicar uma validação especifica de CPF
    status: true
)


#======================================
#   CADASTRAR ALGUMAS TURMAS
#======================================
turma_desenvolvimento_web_1 = curso_php.classroom.create(
    name: "DW1",    # criar uma lógica para gerar o nome, caso seja nesse naipe
    start_year: "2020-05-01", # corrigir o campo para somente ANO
    end_year: "2020-09-31",   # corrigir o campo para somente ANO 
    period: "?" # esse campo não faz sentido existir
)

#======================================
#   CRIAR UM PERIODO
#======================================
periodo_matutino = Period.create(
    start_period: "13:00:00", # alterar o nome do campo para `hour_begin`
    end_period: "17:00:00", # alterar o nome do campo para `hour_end`
    type_period: "matutino",
    day_of_class: "" # melhorar o sentido desse campo
)

#======================================
#   ADICIONAR OS PROFESSORES AS DISCIPLINAS E TURMAS - criando a lista de chamada
#======================================
grade_matutina_curso_dw_logica = Grid.create(
    teacher_id: professora_tina,
    discipline_id: logica_programacao,
    classroom_id: curso_php,
    period_id: periodo_matutino
)

#======================================
#   CRIAR UM ALUNO
#======================================
aluna_juliana = usuario_estudante.student.create(
    name: "Juliana #{rand(100)}Evangelista",
    cpf: "#{rand(999)}.#{rand(999)}.#{rand(999)}-#{rand(99)}", # aplicar validação de cpf
    status: true
)
#======================================
#   MATRICULAR ALUNA A UM CURSO
#======================================
matricula_aluna_juliana = Enrollment.create(
    student_id: aluna_juliana,
    classroom_id: turma_desenvolvimento_web_1,
    period: "", # retirar esse campo
    description: "",
    status: true
)

#======================================
#   CRIAR AVALIAÇÕES
#======================================
avaliacao_p1_logica = Assessment.create(
    name: "P1 de lógica",
    weight: 10
)

#======================================
#   CRIAR A RELAÇÃO DA AVALIAÇÃO PARA O ESTUDANTE (LANÇAR A NOTA DO ALUNO)
#======================================
nota_juliana = StudentAssessment.create(
    assessment_id: avaliacao_p1_logica,
    enrollment_id: matricula_aluna_juliana,
    weight: 7,
    status: true
)

