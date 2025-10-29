CREATE DATABASE smf;

USE smf;

CREATE TABLE Mercado (
	idMercado INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(45) NOT NULL,
    cnpj CHAR(14) NOT NULL -- sem os pontos e traços
);

INSERT INTO Mercado (nome, cnpj) VALUES
	('S Supermercados', '12345678000190'),
	('Mercados São Paulo', '49285185000183'),
	('Supermercado Paulista', '49285185000183');

CREATE TABLE Endereco (
	idEndereco INT AUTO_INCREMENT,
    fkMercado INT NOT NULL,
		CONSTRAINT fkMercadoEndereco -- Referenciando o fkMercado
			FOREIGN KEY (fkMercado)
				REFERENCES Mercado (idMercado),
		CONSTRAINT pkComposta
			PRIMARY KEY (idEndereco, fkMercado),
	cep CHAR(9) NOT NULL, -- sem o traço
    bairro VARCHAR(45) NOT NULL,
    logradouro VARCHAR(100) NOT NULL,
    numero VARCHAR(10) NOT NULL,
    complemento VARCHAR(200)
);

INSERT INTO Endereco VALUES
	(DEFAULT, 1, '084285828', 'Jardim Brasil', 'Rua Brasilzinho', '123A', NULL),
	(DEFAULT, 2, '930293843', 'Vila Paulista', 'Avenida São Paulo', '5920', NULL),
	(DEFAULT, 3, '049284931', 'São Lucas', 'Rua Adriano Peixoto', '31', NULL);

CREATE TABLE Setor (
	idSetor INT AUTO_INCREMENT,
    fkMercado INT NOT NULL,
		CONSTRAINT fkMercadoSetor
			FOREIGN KEY (fkMercado)
				REFERENCES Mercado (idMercado),
		CONSTRAINT pkComposta
			PRIMARY KEY (idSetor, fkMercado),
	nome VARCHAR(45) NOT NULL
);

INSERT INTO Setor (fkMercado, nome) VALUES
	(1, 'Bebidas'),
	(1, 'Açougue'),
	(3,'Bebidas');

CREATE TABLE Sensor (
	idSensor INT PRIMARY KEY AUTO_INCREMENT,
    fkSetor INT NOT NULL,
		CONSTRAINT fkSetorSensor
			FOREIGN KEY (fkSetor)
				REFERENCES Setor (idSetor),
	fkMercado INT NOT NULL,
		CONSTRAINT fkSetorMercado
			FOREIGN KEY (fkMercado)
				REFERENCES Mercado (idMercado),
	statusSensor VARCHAR(45),
		CONSTRAINT chkStatusSensor
			CHECK (statusSensor IN ('Ligado', 'Desligado'))
);

INSERT INTO Sensor (fkSetor, fkMercado, statusSensor) VALUES
	(1, 1, 'Ligado'),
	(2, 1, 'Ligado'),
	(3, 2, 'Ligado');

CREATE TABLE SensorLeitura (
	idSensorLeitura INT AUTO_INCREMENT,
    fkSensor INT NOT NULL,
		CONSTRAINT fkSensorSensorLeitura
			FOREIGN KEY (fkSensor)
				REFERENCES Sensor (idSensor),
		CONSTRAINT pkComposta
			PRIMARY KEY (idSensorLeitura, fkSensor),
    leitura INT NOT NULL,
    dataLeitura DATETIME DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO SensorLeitura (fkSensor, leitura, dataLeitura) VALUES
	(1, 23, '2025-10-27 08:30:00'),
	(1, 25, '2025-10-27 09:00:00'),
	(1, 27, '2025-10-27 09:30:00'),

	(2, 18, '2025-10-27 08:45:00'),
	(2, 20, '2025-10-27 09:15:00'),
	(2, 19, '2025-10-27 09:45:00'),

	(3, 30, '2025-10-27 08:00:00'),
	(3, 31, '2025-10-27 08:30:00'),
	(3, 29, '2025-10-27 09:00:00');

CREATE TABLE Usuario (
	idUsuario INT PRIMARY KEY AUTO_INCREMENT,
    nomeCompleto VARCHAR(45) NOT NULL,
    tipoUsuario VARCHAR(45) NOT NULL,
		CONSTRAINT chkUsuario
			CHECK (tipoUsuario IN ('Funcionário', 'Gerente', 'Colaborador', 'Administrador')),
	senha VARCHAR(45) NOT NULL,
    fkMercado INT NOT NULL,
		CONSTRAINT fkMercadoUsuario
			FOREIGN KEY (fkMercado)
				REFERENCES Mercado (idMercado)
);


INSERT INTO Usuario (nomeCompleto, tipoUsuario, senha, fkMercado) VALUES
	('Lucas Almeida da Silva', 'Administrador', 'LuAS123', 1),
	('Vagner Souza', 'Gerente', 'szVag1', 1),
	('Roberto Assis', 'Funcionário', 'roAssis06', 1);
    
CREATE TABLE Email (
	idEmail INT AUTO_INCREMENT,
    fkUsuario INT NOT NULL,
		CONSTRAINT fkUsuarioEmail
			FOREIGN KEY (fkUsuario)
				REFERENCES Usuario (idUsuario),
		CONSTRAINT pkComposta
			PRIMARY KEY (idEmail, fkUsuario),
	email VARCHAR(100) NOT NULL,
    tipoEmail VARCHAR(45)
		CONSTRAINT chkTipoEmail
			CHECK (tipoEmail IN ('Pessoal', 'Corporativo'))
);

INSERT INTO Email (fkUsuario, email, tipoEmail) VALUES
	(1, 'lucas.almeida@corporativo.com', 'Corporativo'),
	(2, 'vagner.souza@corporativo.com', 'Corporativo'),
	(2, 'vag.souzinha@pessoal.com', 'Pessoal');

CREATE TABLE Telefone (
	idTelefone INT AUTO_INCREMENT,
    fkUsuario INT,
		CONSTRAINT fkUsuarioTelefone
			FOREIGN KEY (fkUsuario)
				REFERENCES Usuario (idUsuario),
		CONSTRAINT pkComposta
			PRIMARY KEY (idTelefone, fkUsuario),
    DDD CHAR(2),
    numero VARCHAR (9),
    tipoNum VARCHAR (45),
		CONSTRAINT chkTipoNum
			CHECK (tipoNum IN ('Pessoal', 'Corporativo'))
);

INSERT INTO Telefone (fkUsuario, DDD, numero, tipoNum) VALUES
	(1, '11', '940284930', 'Corporativo'),
	(2, '11', '972738134', 'Pessoal'),
	(3, '11', '24028430', 'Corporativo');


SELECT m.nome 'Nome Mercado',
	m.cnpj CNPJ,
    e.cep,
    e.numero 'Número'
    from mercado m join endereco e on e.fkMercado = m.idMercado;

SELECT 
	m.nome 'Nome Mercado',
	s.nome 'Nome Setor',
	se.idSensor 'Identificador do Sensor',
	sl.idSensorLeitura 'Leitura do Sensor',
	sl.leitura 'Valor da Leitura',
	sl.dataLeitura 'Data da Leitura'
FROM mercado m 
	JOIN setor s 
		ON s.fkMercado = m.idMercado
	JOIN sensor se 
		ON se.fkSetor = s.idSetor 
		AND se.fkMercado = m.idMercado
	JOIN sensorleitura sl 
		ON sl.fkSensor = se.idSensor;