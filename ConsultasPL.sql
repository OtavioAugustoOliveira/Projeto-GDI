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