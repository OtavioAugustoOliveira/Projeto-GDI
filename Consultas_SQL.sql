/* consultas sql: */

/*1: alter table para alterar o campo complemento na tabela Paciente em não nulo:*/

ALTER TABLE Paciente MODIFY complemento varchar(120);


/*2: Já foi feita no script de criação de tabelas*/
CREATE INDEX idx_funcao
ON Funcionario (funcao);

/*3: Já foi feita no script de povoamento de tabelas*/

INSERT INTO Paciente Values ('01239129222', 'Fernanda Souza de Lima','F', TO_DATE('1993-09-27','YYYY-MM-DD'), '22035330', 'casa amarela', '81999334222');

/*4: Haverá uma troca na gerência, todos os funcionários gerenciados pelo funcionário cujo cpf é 01287138500 passarão a ser agenciados pelo gerente cujo cpf é 08846933232*/

UPDATE Funcionario SET cpf_gerente = '08846933232' where cpf_gerente = '01287138500';

/*5: Deletar o atendente cujo cpf é 09944145012 porque ele pediu demissão*/ 

DELETE FROM Funcionario where CPF = '09944145012';



/*6: Retornar cpf, crm e cpf do gerente de todos os medicos do hospital*/ 

SELECT Medico.CPF_med, Medico.CRM, Funcionario.cpf_gerente FROM Medico, Funcionario where CPF = CPF_med;

/*7: Retornar todos os atendimentos feitos entre janeiro de 2021 e de janeiro de 2022*/ 

SELECT * from Atendimento WHERE data_e_hora BETWEEN TO_DATE('2021-01-01','YYYY-MM-DD' ) and TO_DATE('2022-01-31', 'YYYY-MM-DD' );

/*8: Retornar todos os encaminhamentos feitos para os hospitais cujo codigo identificador sejam 1 e 2*/ 

SELECT * FROM Encaminha where Hospital in (1,2);

/*9: Selecionar todos os funcionarios cujo nome começam com a letra M*/ 

SELECT * FROM Funcionario where nome like 'M%';

/*10: Retornar cpf e nome os funcionários que não são gerenciados por ninguém*/ 

SELECT CPF, nome FROM Funcionario WHERE cpf_gerente IS NULL;

/*11: Retornar os hospitais e o encaminhamento feito de todos os hospitais que receberam  algum encaminhamento*/ 

SELECT * from Hospital inner join Encaminha on Encaminha.hospital = Hospital.codigo_identificador_hospital;

/*12: Retornar o último Encaminhamento registrado no banco de dados*/ 

SELECT max(data_e_hora) from Encaminha;

/*13: Retornar o primeiro atendimento registrado no banco de dados*/ 

SELECT * FROM Atendimento where data_e_hora in ( SELECT min(data_e_hora) from atendimento);

/*14: Pegar a média de atendimentos por enfermeiro */ 

Select avg(quantidade_atendimento) from (Select CPF_FUNC, count(*) as quantidade_atendimento from Enfermeiro inner join 
atendimento on Enfermeiro.CPF_func = Atendimento.enfermeiro group by Enfermeiro.CPF_func );

/*15: Número de funcionarios que possuem algum gerente */ 

SELECT count(*) from Funcionario where cpf_gerente is NOT NULL;

/*16: Reunir todos os pacientes que estão registrados mas que ainda não foram atendidos */ 

SELECT * FROM Paciente LEFT JOIN Atendimento on Paciente.CPF = Atendimento.paciente where Atendimento.paciente IS NULL;

/*17: Todas as emergências ocorridas de janeiro de 2022 em diante: */ 

SELECT * FROM Emergencia where data_e_hora >= TO_DATE('2022-01-01','YYYY-MM-DD');

/*18: Retornar todas as informações sobre último atendimento registrado no banco de dados*/ 

SELECT * FROM Atendimento where data_e_hora in ( SELECT max(data_e_hora) from atendimento);
/*19: Retorna CPF e função dos funcionários caso haja algum cujo nome termina com a  */ 

Select CPF, funcao from Funcionario where nome = ANY (SELECT nome from funcionario where nome like '%a' );
/*20: Retorna todos os atendimentos somente se todos os atendimentos forem feitos  de 2021 em diante.  */ 

Select * from Atendimento where data_e_hora = ALL (SELECT data_e_hora from Atendimento where data_e_hora <= TO_DATE('2021-01-01', 'YYYY-MM-DD' ) );

/*21: Retorna o nome dos funcionarios em ordem alfabética */ 

SELECT nome FROM Funcionario order BY nome;
/*22: Retornar número de mulheres e de homens entre os pacientes */ 

SELECT sexo, COUNT(*) from Paciente GROUP BY sexo;

/*23: Retornar Sexo e número de Pacientes cujos nomes começam com as letra M ou J, se houverem mais de 2 deles.  */ 

SELECT sexo, COUNT(*) from Paciente where nome in (select nome from Paciente 
WHERE nome like 'M%' or nome like 'J%') GROUP BY sexo having COUNT(*) > 2;


/*24: Retorna todos os casos em que o encaminhamento foi realizado depois de janeiro de 2022 ou cujo medico foi o que possui cpf 81287138511, sem repetição de linhas */ 

SELECT * from Encaminha where data_e_hora > TO_DATE('2022-01-01', 'YYYY-MM-DD' ) UNION SELECT * FROM Encaminha where medico =  '81287138511';

/*25: Criar uma visão contendo cpf, cpf_gerente, nome e funcao dos funcionários que são gerenciados*/ 

CREATE VIEW gerenciados as select cpf, cpf_gerente,nome,funcao from Funcionario where cpf_gerente IS NOT NULL;

SELECT * from gerenciados;


/*26: Dar privilégios de select e insert em atendimento para o usuário, depois remover a possibilidade do select FALTO ENTENDER O USUÁRIO, VAI DAR ERRO ASSIM*/ 


GRANT DELETE on Paciente to PUBLIC ;


REVOKE DELETE ON Paciente FROM PUBLIC;

