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
	idEndereco INT PRIMARY KEY AUTO_INCREMENT,
	cep CHAR(9) NOT NULL, -- sem o traço
    bairro VARCHAR(45) NOT NULL,
    logradouro VARCHAR(100) NOT NULL,
    numero VARCHAR(10) NOT NULL,
    complemento VARCHAR(200),
    fkMercado INT NOT NULL,
		CONSTRAINT fkMercadoEndereco -- Referenciando o fkMercado
			FOREIGN KEY (fkMercado)
				REFERENCES Mercado (idMercado)
);

INSERT INTO Endereco VALUES
	(DEFAULT, '084285828', 'Jardim Brasil', 'Rua Brasilzinho', '123A', NULL, 1),
	(DEFAULT, '930293843', 'Vila Paulista', 'Avenida São Paulo', '5920', NULL, 2),
	(DEFAULT, '049284931', 'São Lucas', 'Rua Adriano Peixoto', '31', NULL, 3);

CREATE TABLE Setor (
	idSetor INT PRIMARY KEY AUTO_INCREMENT,
	nome VARCHAR(45) NOT NULL, 
    fkMercado INT NOT NULL,
		CONSTRAINT fkMercadoSetor
			FOREIGN KEY (fkMercado)
				REFERENCES Mercado (idMercado)
);

INSERT INTO Setor (nome, fkMercado) VALUES
	('Bebidas', 1),
	('Açougue', 1),
	('Bebidas', 3);

CREATE TABLE Sensor (
	idSensor INT PRIMARY KEY AUTO_INCREMENT,
    fkSetor INT NOT NULL,
		CONSTRAINT fkSetorSensor
			FOREIGN KEY (fkSetor)
				REFERENCES Setor (idSetor)
);

INSERT INTO Sensor (fkSetor) VALUES
	(1),
	(2),
	(3);

CREATE TABLE sensor_leitura (
	idSensorLeitura INT PRIMARY KEY AUTO_INCREMENT,
    leitura INT NOT NULL,
    dataLeitura DATETIME DEFAULT CURRENT_TIMESTAMP,
    fkSensor INT NOT NULL,
		CONSTRAINT fkSensorSensorLeitura
			FOREIGN KEY (fkSensor)
				REFERENCES Sensor (idSensor)
);

CREATE TABLE Usuario (
	idUsuario INT PRIMARY KEY AUTO_INCREMENT,
    nomeCompleto VARCHAR(45) NOT NULL,
    tipoUsuario VARCHAR(45) NOT NULL,
		CONSTRAINT chkUsuario
			CHECK (tipoUsuario IN ('Funcionário', 'Gerente', 'Dono')),
	senha VARCHAR(45) NOT NULL,
    fkMercado INT NOT NULL,
		CONSTRAINT fkMercadoUsuario
			FOREIGN KEY (fkMercado)
				REFERENCES Mercado (idMercado)
);

INSERT INTO Usuario (nomeCompleto, tipoUsuario, senha, fkMercado) VALUES
	('Lucas Almeida da Silva', 'Dono', 'LuAS123', 1),
	('Vagner Souza', 'Gerente', 'szVag1', 1),
	('Roberto Assis', 'Funcionário', 'roAssis06', 1);
    
CREATE TABLE Email (
	idEmail INT PRIMARY KEY AUTO_INCREMENT,
    email VARCHAR(100) NOT NULL,
    tipoEmail VARCHAR(45)
		CONSTRAINT chkTipoEmail
			CHECK (tipoEmail IN ('Pessoal', 'Corporativo')),
	fkUsuario INT NOT NULL,
		CONSTRAINT fkUsuarioEmail
			FOREIGN KEY (fkUsuario)
				REFERENCES Usuario (idUsuario)
);

INSERT INTO Email (email, tipoEmail, fkUsuario) VALUES
	('lucas.almeida@corporativo.com', 'Corporativo', 1),
	('vagner.souza@corporativo.com', 'Corporativo', 2),
	('vag.souzinha@pessoal.com', 'Pessoal', 2);

CREATE TABLE Telefone (
	idTelefone INT PRIMARY KEY AUTO_INCREMENT,
    DDD CHAR(2),
    numero VARCHAR (9),
    tipoNum VARCHAR (45),
		CONSTRAINT chkTipoNum
			CHECK (tipoNum IN ('Fixo', 'Pessoal', 'Corporativo')),
    fkUsuario INT,
		CONSTRAINT fkUsuarioTelefone
			FOREIGN KEY (fkUsuario)
				REFERENCES Usuario (idUsuario),
	fkEndereco INT,
		CONSTRAINT fkEndercoTelefone
			FOREIGN KEY (fkEndereco)
				REFERENCES Endereco (idEndereco)
);

INSERT INTO Telefone (DDD, numero, tipoNum, fkUsuario, fkEndereco) VALUES
	('11', '940284930', 'Corporativo', 1, NULL),
	('11', '972738134', 'Pessoal', 2, NULL),
	('11', '24028430', 'Fixo', NULL, 1);
