-- 2: USO DE ESTRUTURA DE DADOS DO TIPO TABLE
-- Criando uma nova tabela que terá o nome de todos os funcionários

DECLARE
    i BINARY_INTEGER := 0;
    nome_variavel Funcionario.nome%TYPE;
    TYPE TabelaNomes IS TABLE OF Funcionario.nome%TYPE INDEX BY BINARY_INTEGER;
    new_table TabelaNomes;
    CURSOR nomes_cursor IS SELECT nome FROM Funcionario;
BEGIN
     OPEN nomes_cursor;
     
         LOOP
             FETCH nomes_cursor INTO nome_variavel;
             new_table(i) := nome_variavel;
             DBMS_OUTPUT.Put_line(new_table(i));
             i := i+1;
             EXIT WHEN nomes_cursor%NOTFOUND;
         END LOOP;
END;

--3: USO DE BLOCO ANÔNIMO
-- Utilizando um bloco anômino para mostrar todos os pacientes 

DECLARE
    iterator BINARY_INTEGER := 0;
    patient_name Paciente.nome%TYPE;
    CURSOR pointer IS SELECT nome FROM Paciente;
BEGIN
    OPEN pointer;
        LOOP
            FETCH pointer INTO patient_name;
            DBMS_OUTPUT.Put_line(patient_name);
            iterator := iterator + 1;
            EXIT WHEN pointer%NOTFOUND;
        END LOOP;
END;


-- 6: %TYPE
-- Utilizando type para definir uma variável do tipo funcao e criando uma tabela com isso
DECLARE
    i BINARY_INTEGER := 0;
    funcao_var Funcionario.funcao%TYPE;
    TYPE TabelaFuncoes IS TABLE OF Funcionario.funcao%TYPE INDEX BY BINARY_INTEGER;
    new_table TabelaFuncoes;
    CURSOR funcoes_cursor IS SELECT funcao FROM Funcionario;
BEGIN
     OPEN funcoes_cursor;
     
         LOOP
             FETCH funcoes_cursor INTO funcao_var;
             new_table(i) := funcao_var;
             DBMS_OUTPUT.Put_line(new_table(i));
             i := i+1;
             EXIT WHEN funcoes_cursor%NOTFOUND;
         END LOOP;
END;

-- 7 : %ROWTYPE
-- Utilizando rowtype para definir uma variável que armazena todos os valores da linha que está sendo lida 

DECLARE
    patient_infos Paciente%ROWTYPE;
BEGIN
    SELECT *
    INTO patient_infos
    FROM Paciente
    WHERE cpf = 01287169500;
    DBMS_OUTPUT.Put_line(patient_infos.nome || ' ' || patient_infos.sexo || ' ' || patient_infos.telefone);
END;

-- 10 LOOP EXIT WHEN
-- Utilizando Exit When para encerrar o loop quando o cursor de diagnósticos tiver percorrido por todos os diagnosticos da tabela de examina
DECLARE
    i BINARY_INTEGER := 0;
    diagnostico_var Examina.diagnostico%TYPE;
    TYPE TabelaDiagnosticos IS TABLE OF Examina.diagnostico%TYPE INDEX BY BINARY_INTEGER;
    new_table TabelaDiagnosticos;
    CURSOR diagnosticos_cursor IS SELECT diagnostico FROM Examina;
BEGIN
     OPEN diagnosticos_cursor;
     
         LOOP
             FETCH diagnosticos_cursor INTO diagnostico_var;
             new_table(i) := diagnostico_var;
             DBMS_OUTPUT.Put_line(new_table(i));
             i := i+1;
             EXIT WHEN diagnosticos_cursor%NOTFOUND;
         END LOOP;
END;

-- 15: WHILE LOOP
-- Utilizando While Loop para percorrer todos os pacientes da tabela de pacientes e printar seus nomes

DECLARE 
    iterator BINARY_INTEGER := 0;
    patient_count BINARY_INTEGER := 0;
    patient_name Paciente.nome%TYPE;
    CURSOR pointer IS SELECT nome FROM Paciente;
BEGIN
    OPEN pointer;
        SELECT
        COUNT(*)
        INTO patient_count
        FROM Paciente;
        WHILE iterator < patient_count LOOP
            FETCH pointer INTO patient_name;
            DBMS_OUTPUT.Put_line(patient_name);
            iterator := iterator + 1;
        END LOOP;
END;


-- 14 CURSOR (OPEN, FETCH e CLOSE)
-- Criando uma nova tabela de especialização dos hospitais, pegando as informações com o cursor
-- , abrindo ele para ser utilizado, usando fetch para colocar as informações na variável e então fechando-o para liberar espaço
DECLARE
    i BINARY_INTEGER := 0;
    espec_var hospital.Especializacao%TYPE;
    TYPE TabelaEspecs IS TABLE OF hospital.Especializacao%TYPE INDEX BY BINARY_INTEGER;
    new_table TabelaEspecs;
    CURSOR especs_cursor IS SELECT Especializacao FROM Hospital;
BEGIN
     OPEN especs_cursor;
     
         LOOP
             FETCH especs_cursor INTO espec_var;
             new_table(i) := espec_var;
             DBMS_OUTPUT.Put_line(new_table(i));
             i := i+1;
             EXIT WHEN especs_cursor%NOTFOUND;
         END LOOP;
     CLOSE especs_cursor;

END;

-- 16: EXCEPTION WHEN
-- Utilizando exception when para tratar o erro de não encontrar um paciente na tabela de pacientes

DECLARE
    patient_info Paciente%ROWTYPE;
BEGIN
    SELECT *
    INTO patient_info
    FROM Paciente
    WHERE cpf = 1;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.Put_line('Não encontrado');
END;


--18 CREATE OR REPLACE PACKAGE BODY
-- Criando um package que contem o procedimento de criar paciente, e então fazendo o seu respectivo body

CREATE OR REPLACE PACKAGE paciente_package AS
    PROCEDURE criar_paciente(CPF Paciente.CPF%TYPE, Nome Paciente.NOME%TYPE, Sexo Paciente.SEXO%TYPE,
    DataNas Paciente.DATA_DE_NASCIMENTO%TYPE, CEP Paciente.CEP%TYPE, Complemento Paciente.COMPLEMENTO%TYPE, Tel Paciente.TELEFONE%TYPE);
END paciente_package;
/
CREATE OR REPLACE PACKAGE BODY paciente_package AS
    PROCEDURE criar_paciente(CPF Paciente.CPF%TYPE, Nome Paciente.NOME%TYPE, Sexo Paciente.SEXO%TYPE,
    DataNas Paciente.DATA_DE_NASCIMENTO%TYPE, CEP Paciente.CEP%TYPE, Complemento Paciente.COMPLEMENTO%TYPE, Tel Paciente.TELEFONE%TYPE) IS
    BEGIN 
        INSERT INTO Paciente(CPF, NOME, SEXO, DATA_DE_NASCIMENTO, CEP, COMPLEMENTO, TELEFONE)
            VALUES (CPF, Nome, Sexo, DataNas, CEP, Complemento, Tel);
    END criar_paciente;
END paciente_package;
/

-- 19: CREATE OR REPLACE TRIGGER (COMANDO)
-- Criando um trigger para criar um médico quando um funcionário com o cargo de médico for criado

CREATE OR REPLACE TRIGGER medico_trigger AFTER INSERT ON Funcionario FOR EACH ROW WHEN(NEW.funcao = 'medico')
BEGIN
    INSERT INTO Medico VALUES ('01327455340', '78951234-0/BR');
    DBMS_OUTPUT.PUT_LINE('Médico criado');
END;
/
INSERT INTO Funcionario Values ('01327455340',  '08846933232',  'José Ayrton', 'medico', TO_DATE('1973-04-28','YYYY-MM-DD'), '81999553414');