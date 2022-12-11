DROP TABLE paciente, prontuario, medico, anotacaoprontuario CASCADE; 

CREATE TABLE IF NOT EXISTS Paciente(
	id serial PRIMARY KEY,
	nome text,
	data_nascimento text,
	endereco text NULL,
	cpf text
);

CREATE TABLE Prontuario(
	id serial PRIMARY KEY,
	data_internacao text,
	duracao_internacao int DEFAULT 0,
	motivo_internacao text DEFAULT 'A DESCOBRIR',
	status text DEFAULT 'ATIVO',
	fk_paciente int NOT NULL,
	FOREIGN KEY (fk_paciente) REFERENCES Paciente(id)  ON DELETE SET NULL ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS Medico(
	id serial,
	nome text,
	especialidade text NOT NULL,
	crm text PRIMARY KEY NOT NULL
);

CREATE TABLE IF NOT EXISTS AnotacaoProntuario(
	id serial PRIMARY KEY,
	data_info text,
	informacaoes text NULL,
	fk_medico text,
	fk_prontuario int,
	FOREIGN KEY (fk_prontuario) REFERENCES Prontuario (id)  ON DELETE SET NULL ON UPDATE CASCADE,
	FOREIGN KEY (fk_medico) REFERENCES Medico (crm)  ON DELETE SET NULL ON UPDATE CASCADE
);

--INSERT dos Pacientes

INSERT INTO Paciente (nome,	data_nascimento, endereco, cpf)
VALUES ('Carla Fernandes','12\06\1999','Rua Carlinhos Jose', '89745632558');

INSERT INTO Paciente (nome,	data_nascimento, endereco, cpf)
VALUES ('Camila Castro','09\12\1999','Rua Fernado Po', '78556321445');

INSERT INTO Paciente (nome,	data_nascimento, endereco, cpf)
VALUES ('Julia Anacleto','25\08\1999','Av Mauricio Souza', '05448963205');

INSERT INTO Paciente (nome,	data_nascimento, endereco, cpf)
VALUES ('Ana Cecilia Nascimento','29\02\1999','Av Alencio Souza', '00336589017');

INSERT INTO Paciente (nome,	data_nascimento, endereco, cpf)
VALUES ('Juliana Pedrosa','30\01\1999','Rua Cel. Augusto', '99955563102');

--INSERT dos Medicos

INSERT INTO Medico (nome, especialidade, crm)
VALUES ('Danilo','Cirurgiao Geral', '123456');

INSERT INTO Medico (nome, especialidade, crm)
VALUES ('Pedro','Cirurgiao Geral', '987456');

INSERT INTO Medico (nome, especialidade, crm)
VALUES ('Francielio','Clinico Geral', '951357');

INSERT INTO Medico (nome, especialidade, crm)
VALUES ('Augusto','Clinico Geral', '023058');

INSERT INTO Medico (nome, especialidade, crm)
VALUES ('Renato','Neuro Cirurgiao', '123123');

--INSERT dos Prontuarios

INSERT INTO Prontuario (data_internacao, duracao_internacao, motivo_internacao,	status, fk_paciente)
VALUES ('11/03/2022', 3, 'Falta de ar', 'Ativo', 1);

INSERT INTO Prontuario (data_internacao, duracao_internacao, motivo_internacao,	status, fk_paciente)
VALUES ('14/04/2022', 4, 'Tosse constante', 'Ativo', 1);

INSERT INTO Prontuario (data_internacao, duracao_internacao, motivo_internacao,	status, fk_paciente)
VALUES ('1/05/2022', 8, 'Falta de ar', 'Ativo', 1);

INSERT INTO Prontuario (data_internacao, duracao_internacao, motivo_internacao,	status, fk_paciente)
VALUES ('08/05/2022', 5, 'Dificuldade em respirar', 'Ativo', 1);

INSERT INTO Prontuario (data_internacao, duracao_internacao, motivo_internacao,	status, fk_paciente)
VALUES ('05/10/2022', 5, 'Insuficiencia Pulmonar', 'Ativo', 1);

INSERT INTO Prontuario (data_internacao, duracao_internacao, motivo_internacao,	status, fk_paciente)
VALUES ('10/12/2022', 3, 'Dores no abdomem', 'Ativo', 3);

INSERT INTO Prontuario (data_internacao, duracao_internacao, motivo_internacao,	status, fk_paciente)
VALUES ('09/12/2022', 4, 'Vomito e Nausea', 'Ativo', 4);

--INSERT das AnotacoesProntuario

INSERT INTO AnotacaoProntuario (data_info,	informacaoes,fk_medico,	fk_prontuario)
VALUES ('11/03/2022', 'Paciente Fuma desde os 14 anos', '123456', 5);

INSERT INTO AnotacaoProntuario (data_info,	informacaoes,fk_medico,	fk_prontuario)
VALUES ('11/03/2022', 'Pulmoes com somente 50% da capacidade', '123456', 5);

INSERT INTO AnotacaoProntuario (data_info,	informacaoes,fk_medico,	fk_prontuario)
VALUES ('05/10/2022', 'Pulmoes manchados e infeccionados', '123456', 5);

INSERT INTO AnotacaoProntuario (data_info,	informacaoes,fk_medico,	fk_prontuario)
VALUES ('05/10/2022', 'Infeccao generalizada por conta da nicotina', '951357', 5);

INSERT INTO AnotacaoProntuario (data_info,	informacaoes,fk_medico,	fk_prontuario)
VALUES ('05/10/2022', 'Paciente agora Dependende de transplante de Pulmoes', '023058', 5);

INSERT INTO AnotacaoProntuario (data_info,	informacaoes,fk_medico,	fk_prontuario)
VALUES ('10/12/2022', 'Paciente sofreu pancada no pneumotorax', '023058', 7);

INSERT INTO AnotacaoProntuario (data_info,	informacaoes,fk_medico,	fk_prontuario)
VALUES ('09/12/2022', 'Paciente com Intoxicacao alimentar apos comer salmao', '023058', 8);

--1.Altere o status de dois prontuários para inativo

SELECT *
FROM prontuario

UPDATE prontuario
SET status = 'Inativo'
WHERE fk_paciente = 3;

UPDATE prontuario
SET status = 'Inativo'
WHERE fk_paciente = 4;

--2.Altere o CPF do paciente Carla para 01323344599

UPDATE paciente
SET cpf = '01323344599'
WHERE nome = 'Carla Fernandes';

--3.Delete o médico com nome Pedro

DELETE FROM medico
WHERE nome = 'Pedro';

--4.Buscar todos os alunos que tenham c no seu nome (maiúsculo ou minúsculo)

SELECT * FROM paciente
WHERE nome ILIKE 'c%'

--5.Selecione o nome de todos os pacientes que estão internados,
--ou seja, que tem um prontuário ativo

