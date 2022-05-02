

CREATE TABLE tb_Paciente OF tp_Paciente(

    CPF PRIMARY KEY,
    data_de_nascimento CHECK (data_de_nascimento > TO_DATE('1880-01-01','YYYY-MM-DD')),
    complemento NULL
);
/


CREATE TABLE tb_Funcionario of tp_Funcionario(
    cpf_gerente NULL,
    data_de_nascimento CHECK (data_de_nascimento > TO_DATE('1880-01-01','YYYY-MM-DD')),
    CONSTRAINT PK_Funcionario PRIMARY KEY (CPF),
    CONSTRAINT FK_cpf_gerente FOREIGN KEY (cpf_gerente) REFERENCES tb_Funcionario(CPF)
);
/


CREATE TABLE tb_Medico of tp_Medico(
    CPF_med NOT NULL, 
    CRM NOT NULL,
    CONSTRAINT PK_Medico PRIMARY KEY (CPF_med),
    CONSTRAINT FK_medico_para_funcionario FOREIGN KEY (CPF_med) REFERENCES tb_Funcionario(CPF) 
);
/


CREATE TABLE tb_Enfermeiro OF tp_Enfermeiro (
    CPF_func NOT NULL, 
    COREN NOT NULL, 
    CONSTRAINT PK_Enfermeiro PRIMARY KEY (CPF_func), 
    CONSTRAINT FK_enfermeiro_para_funcionario FOREIGN KEY (CPF_func) REFERENCES tb_Funcionario(CPF) 
)
/


CREATE TABLE tb_Hospital OF tp_Hospital(
    complemento NULL,
    CONSTRAINT PK_Hospital PRIMARY KEY (codigo_identificador_hospital) 
);
/


CREATE TABLE tb_Atendimento OF tp_Atendimento(
    paciente NOT NULL,
    enfermeiro NOT NULL,
    CONSTRAINT PK_Atendimento PRIMARY KEY (paciente,enfermeiro),
    CONSTRAINT FK_atendimento_para_paciente FOREIGN KEY (paciente) REFERENCES tb_Paciente(CPF), 
    CONSTRAINT FK_atendimento_para_enfermeiro FOREIGN KEY (enfermeiro) REFERENCES tb_Enfermeiro(CPF_func) 
);
/


CREATE TABLE tb_Emergencia OF tp_Emergencia(
    paciente NOT NULL,
    enfermeiro NOT NULL,
    CONSTRAINT PK_Emergencia PRIMARY KEY (codigo_identificador_emergencia), 
    CONSTRAINT FK_Emergencia_para_Atendimento FOREIGN KEY (paciente,enfermeiro) REFERENCES tb_Atendimento(paciente,enfermeiro)
);
/


CREATE TABLE tb_Contato_de_Emergencia OF tp_Contato_de_Emergencia (
    CPF_PAC NOT NULL,
    CONSTRAINT PK_Contato_de_Emergencia PRIMARY KEY (CPF_PAC,nome)
);
/

CREATE TABLE tb_Examina OF tp_Examina(
    medico NOT NULL,
    paciente NOT NULL,
    CONSTRAINT PK_Examina PRIMARY KEY (medico,paciente), 
    CONSTRAINT FK_Examina_para_medico FOREIGN KEY (medico) REFERENCES tb_Medico(CPF_med), 
    CONSTRAINT FK_Examina_para_paciente FOREIGN KEY (paciente) REFERENCES tb_Paciente(CPF) 

);
/


CREATE TABLE tb_Encaminha OF tp_Encaminha(
    medico NOT NULL,
    paciente NOT NULL,
    hospital NOT NULL,
    CONSTRAINT PK_Encaminha PRIMARY KEY (medico,paciente,hospital,data_e_hora),
    CONSTRAINT FK_Encaminha_para_medico FOREIGN KEY (medico) REFERENCES tb_Medico(CPF_med), 
    CONSTRAINT FK_Encaminha_para_paciente FOREIGN KEY (paciente) REFERENCES tb_Paciente(CPF), 
    CONSTRAINT FK_Encaminha_para_hospital FOREIGN KEY (hospital) REFERENCES tb_Hospital(codigo_identificador_hospital) 

);
/


CREATE TABLE tb_Especializacao OF tp_Especializacao (
    funcionario NOT NULL,
    especializacao NOT NULL,
    CONSTRAINT PK_Especializacao PRIMARY KEY (funcionario,especializacao), 
    CONSTRAINT FK_Especializacao_para_funcionario FOREIGN KEY (funcionario) REFERENCES tb_Funcionario(CPF)
    
);
/

CREATE SEQUENCE codigo_identificador_emergencia INCREMENT BY 1 START WITH 1;

CREATE SEQUENCE codigo_identificador_hospital INCREMENT BY 1 START WITH 1