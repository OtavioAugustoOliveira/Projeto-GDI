 /* Checklist AV5
-1. CREATE OR REPLACE TYPE - ✅
-2. CREATE OR REPLACE TYPE BODY - ✅
-3. MEMBER PROCEDURE - ✅
-4. MEMBER FUNCTION - ✅
-5. ORDER MEMBER FUNCTION - ✅
-6. MAP MEMBER FUNCTION - ✅
-7. CONSTRUCTOR FUNCTION - ✅
-8. OVERRIDING MEMBER - ✅
-9. FINAL MEMBER - ✅
-10. NOT INSTANTIABLE TYPE/MEMBER - ✅
-11. HERANÇA DE TIPOS (UNDER/NOT FINAL) - ✅
-12. ALTER TYPE - ✅
-13. CREATE TABLE OF - ✅
-14. WITH ROWID REFERENCES - ✅
-15. REF - ✅
-16. SCOPE IS - ✅
-17. INSERT INTO - ✅
-18. VALUE - ✅
-19. VARRAY - ✅
-20. NESTED TABLE  ✅

*/



CREATE OR REPLACE TYPE tp_endereco AS OBJECT(
    cep varchar(24),
    complemento varchar(24),
    numero varchar(24)
    
);
/


CREATE OR REPLACE TYPE tp_telefone AS OBJECT (

    numero VARCHAR2 (15)

);
/


CREATE OR REPLACE TYPE VARRAY_TP_telefone AS VARRAY (3) OF tp_telefone;
/


CREATE OR REPLACE TYPE tp_Contato_De_Emergencia AS OBJECT (  
    nome varchar(256),
    telefone VARRAY_tp_telefone
);
/



CREATE OR REPLACE TYPE tp_contato_emergencia_nested AS TABLE OF tp_Contato_De_Emergencia;
/


CREATE OR REPLACE TYPE tp_Funcionario AS OBJECT ( 
    CPF varchar(24), 
    nome varchar(256),  
    data_de_nascimento date,
    MEMBER PROCEDURE descrever_funcionario
 
) NOT FINAL NOT INSTANTIABLE;
/


ALTER TYPE tp_Funcionario
    ADD ATTRIBUTE (telefone VARRAY_tp_telefone)
    CASCADE;

/

CREATE OR REPLACE TYPE BODY tp_Funcionario AS
MEMBER PROCEDURE descrever_funcionario IS

BEGIN
    DBMS_OUTPUT.PUT_LINE('Descrevendo Funcionario:');
    DBMS_OUTPUT.PUT_LINE('CPF:' || CPF);
    DBMS_OUTPUT.PUT_LINE('Nome:' || nome);

    END;
END;

/



CREATE OR REPLACE TYPE tp_Medico UNDER tp_Funcionario  ( 
    CRM varchar(24),
    OVERRIDING MEMBER PROCEDURE descrever_funcionario,
    CONSTRUCTOR FUNCTION tp_Medico (objeto tp_Medico) RETURN SELF AS RESULT
    
);
/


CREATE OR REPLACE TYPE BODY tp_Medico AS

OVERRIDING MEMBER PROCEDURE descrever_funcionario IS
BEGIN
    DBMS_OUTPUT.PUT_LINE('Descrevendo Funcionario:');
    DBMS_OUTPUT.PUT_LINE('CPF:' || CPF);
    DBMS_OUTPUT.PUT_LINE('Nome:' || nome);
    DBMS_OUTPUT.PUT_LINE('CRM:' || CRM);
    END;

CONSTRUCTOR FUNCTION tp_Medico (objeto tp_Medico) RETURN SELF AS RESULT IS
BEGIN
    cpf := objeto.cpf;
    nome := objeto.nome;
    data_de_nascimento := objeto.data_de_nascimento;
    crm := objeto.CRM;
    RETURN;
END;

END;


/



CREATE OR REPLACE TYPE tp_Enfermeiro UNDER tp_Funcionario  ( 
    COREN varchar(24)
);
/

CREATE OR REPLACE TYPE tp_Paciente AS OBJECT ( 
    CPF varchar(24), 
    nome varchar(256), 
    sexo varchar(12), 
    data_de_nascimento date,  
    endereco tp_endereco,
    telefone VARRAY_tp_telefone,
    contatos_vinculados  tp_contato_emergencia_nested,
    MAP MEMBER FUNCTION retorna_paciente RETURN varchar2

);
/


CREATE OR REPLACE TYPE BODY tp_Paciente AS 
MAP MEMBER FUNCTION retorna_paciente RETURN varchar2
    IS
    BEGIN
     RETURN ('CPF:'   || CPF ||
            ', nome:' || nome ||
            ', sexo:'  || sexo);

        END;
    
    
    END;

/

CREATE OR REPLACE TYPE tp_Hospital AS OBJECT  ( 
    codigo_identificador_hospital INTEGER,
    nome varchar(256),
    endereco tp_endereco,
    especializacao varchar(64), 
    telefone VARRAY_tp_telefone,
    FINAL MEMBER FUNCTION retorna_incremento_id_hospital RETURN NUMBER
);
/

CREATE OR REPLACE TYPE BODY tp_Hospital AS 
FINAL MEMBER FUNCTION retorna_incremento_id_hospital RETURN NUMBER IS
    BEGIN
        RETURN codigo_identificador_hospital + 1;
    END;
END;
/



CREATE OR REPLACE TYPE tp_Encaminha AS OBJECT (  
    medico REF tp_Medico, 
    paciente REF tp_Paciente, 
    hospital REF tp_Hospital, 
    data_e_hora TIMESTAMP(0),
    ORDER MEMBER FUNCTION func_compara_data_e_hora (objeto tp_Encaminha) RETURN NUMBER
  
);
/

CREATE OR REPLACE TYPE BODY tp_Encaminha AS 
    ORDER MEMBER FUNCTION func_compara_data_e_hora (objeto tp_Encaminha) RETURN NUMBER IS
    BEGIN
        IF SELF.data_e_hora < objeto.data_e_hora THEN
            RETURN -1;
        
        ELSIF SELF.data_e_hora > objeto.data_e_hora THEN
            RETURN 1;

        ELSE
            RETURN 0;
        END IF;

    END;
END;
/

CREATE OR REPLACE TYPE tp_Examina AS OBJECT (
    medico REF tp_Medico,
    paciente REF tp_Paciente,
    diagnostico varchar(256),
    data_e_hora TIMESTAMP(0)
);

/



