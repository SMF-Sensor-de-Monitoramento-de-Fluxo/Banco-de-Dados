show databases;
use projeto;

create table mercado(
idMercado int primary key auto_increment,
nomeMercado varchar(45),
cnpj char(14)
);

create table endereço(
idEndereco int primary key auto_increment,
cep char (8),
numEnd varchar(45),
bairro varchar(45),
cidade varchar(45),
uf char (2),
fkMercadoEnd int,
constraint fkEnderecoMercado
	foreign key (fkMercadoEnd)
		references mercado (idMercado)
);

create table responsável(
idResponsavel int primary key auto_increment,
nomeResponsavel varchar(45),
emailResponsavel varchar(45),
tel char(12),
senha varchar(45),
fkMercadoResp int,
constraint fkResponsavelMercado
	foreign key (fkMercadoResp)
		references mercado (idMercado)
);

create table sensor(
idSensor int primary key auto_increment,
corredor int,
dataLeitura datetime,
fkSensorMercado int,
constraint fkSensorMercado
	foreign key (fkSensorMercado)
		references mercado(idMercado)
);

create table sensorLeitura(
idLeitura int primary key auto_increment,
leitura int,
fkSensorLeitura int,
constraint fkSensorLeitura
	foreign key (fkSensorLeitura)
		references sensor (idSensor)
);







