CREATE OR REPLACE TYPE tp_Paciente AS OBJECT ( 
    CPF varchar(24), 
    nome varchar(256), 
    sexo varchar(12), 
    data_de_nascimento date , 
    cep varchar(24), 
    complemento varchar(32) NULL, 
    telefone varchar(15),
    MAP MEMBER FUNCTION retorna_paciente RETURN varchar

);
/

'''CREATE OR REPLACE TYPE BODY tp_Paciente AS MAP MEMBER FUNCTION retorna_paciente RETURN varchar
    IS
    BEGIN
     RETURN (CPF: '  || SELF.CPF ||',
            nome: '|| SELF.NOME ||',
            sexo:  '|| SELF.sexo ||');

        END;
    END;

/'''


CREATE OR REPLACE TYPE tp_Funcionario AS OBJECT ( 
    CPF varchar(24) , 
    cpf_gerente varchar(24), 
    nome varchar(256), 
    funcao varchar(30), 
    data_de_nascimento date, 
    telefone varchar(15)     
 
) NOT FINAL;
/

CREATE OR REPLACE TYPE tp_Medico UNDER tp_Funcionario  ( 
    CPF_med varchar(24), 
    CRM varchar(24)
   
);
/


CREATE OR REPLACE TYPE tp_Enfermeiro UNDER tp_Funcionario  ( 
    CPF_func varchar(24), 
    COREN varchar(24)
);
/

CREATE OR REPLACE TYPE tp_Hospital AS OBJECT  ( 
    codigo_identificador_hospital varchar(240), 
    nome varchar(256), 
    cep varchar(15), 
    complemento varchar(20), 
    numero varchar(15), 
    especializacao varchar(15), 
    telefone varchar(15)
    MEMBER FUNCTION retorna_nome_hospital RETURN varchar
);
/

CREATE OR REPLACE TYPE tp_Atendimento AS OBJECT ( 
    paciente varchar(256), 
    enfermeiro varchar(256), 
    data_e_hora TIMESTAMP(0), 
    descricao varchar(256), 
    anamnese varchar(256)
   
);
/

CREATE OR REPLACE TYPE tp_Emergencia AS OBJECT (  
    codigo_identificador_emergencia varchar(240), 
    paciente varchar(256), 
    enfermeiro varchar(256), 
    situacao_inicial varchar(256), 
    numero_da_sala varchar(10), 
    resultado varchar(256), 
    data_e_hora TIMESTAMP(0)
    
);
/


CREATE OR REPLACE TYPE tp_Contato_de_Emergencia AS OBJECT  ( 
    CPF_PAC varchar(24), 
    nome varchar(256), 
    telefone varchar(15)
   
 
);
/

CREATE OR REPLACE TYPE tp_Examina AS OBJECT ( 
    medico varchar(256), 
    paciente varchar(256), 
    diagnostico varchar(256), 
    data_e_hora TIMESTAMP(0)
   

 
);
/

CREATE OR REPLACE TYPE tp_Encaminha AS OBJECT (  
        medico varchar(256), 
        paciente varchar(256), 
        hospital varchar(256), 
        data_e_hora TIMESTAMP(0)
 
 
);
/

CREATE OR REPLACE TYPE tp_Especializacao AS OBJECT ( 
    funcionario varchar(256), 
    especializacao varchar(256)
     
 
);
/