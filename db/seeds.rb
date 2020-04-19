#======================================
#   CRIAR UM USUÁRIO
#======================================
usuario_professor = User.create(
    email: "usuario1@localhost.com",
    encrypted_password: "123456789"
)

usuario_estudante = User.create(
    email: "estudante@localhost.com",
    encrypted_password: "123456789"
)

#======================================
#   CRIAR UM CURSO
#======================================
curso_php = Course.create(
    name: "Desenvolvimento Web - Frontend",
    titration: "técnico",
    amount_periods_months: "10", 
    workload: 360,
    status: true
)

#======================================
#   CRIAR DISCIPLINAS PARA O CURSO
#======================================
logica_programacao = Discipline.create(
    name: "Lógica de programação",
    course_id: curso_php   # Se algum curso mudar disciplina no futuro, isso irá alterar a grade dos cursos existente.
)

#======================================
#   CADASTRAR ALGUNS PROFESSORES
#======================================
professora_tina = Teacher.create(
    name: "Cristina Ferreira",
    cpf: "000.000.000-01", # aplicar uma validação especifica de CPF
    status: true,
    user: usuario_professor
)
puts professora_tina
exit!

#======================================
#   CADASTRAR ALGUMAS TURMAS
#======================================
turma_desenvolvimento_web_1 = Classroom.create(
    name: "DW1",    # criar uma lógica para gerar o nome, caso seja nesse naipe
    start_year: "2020-05-01", # corrigir o campo para somente ANO
    end_year: "2020-09-31",   # corrigir o campo para somente ANO 
    period: "?", # esse banco não faz sentido existir
    course_id: curso_php
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
aluna_juliana = Student.create(
    name: "Juliana Evangelista",
    cpf: "111.111.111-11", # aplicar validação de cpf
    status: true,
    user_id: usuario_estudante
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
avaliacao_p1_logica = assessment.create(
    name: "P1 de lógica",
    weight: 10,
    grid_id: grade_matutina_curso_dw_logica
)

#======================================
#   CRIAR A RELAÇÃO DA AVALIAÇÃO PARA O ESTUDANTE (LANÇAR A NOTA DO ALUNO)
#======================================
nota_juliana = StudentAssessment.create(
    name: "nota 1", # qual é a necessidade deste campo?
    assessment_id: avaliacao_p1_logica,
    enrollment_id: matricula_aluna_juliana,
    weight: 7,
    status: true
)

