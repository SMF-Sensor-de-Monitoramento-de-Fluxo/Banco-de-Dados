create database smf;

use smf;

create table cliente(
idCliente int primary key,
nome varchar (50),
email varchar (50),
senha varchar (50)
);

insert into cliente values
(1,'joao','joao@gmail.com','12345678'),
(2,'isabela','isabela@gmail.com','87654321'),
(3,'guilherme','guilherme@gmail.com','43215678'),
(4,'arthur','arthur@gmail.com','12348765'),
(5,'richard','richard@gmail.com','12365478'),
(6,'renan','renan@gmail.com','21435678');


create table estabelecimento(
idEstabelecimento int primary key,
nomeEstabelecimento varchar (50) not null,
cnpj char (14) unique,  -- 14 digitos sem os pontos e barra -> 12345678000123
telefone char(10),  -- com ddd mas sem parenteses e hifen -> 1112345678
fkCliente int,
foreign key  (fkCliente)
references cliente (idCliente)
);

insert into estabelecimento values
(1,'mercado','xxxxxxxxxxxxxx','1112345678',1),
(2,'mercadinho','yyyyyyyyyyyyyy','1187654321',2),
(3,'mercadao','zzzzzzzzzzzzzz','1143215678',3),
(4,'mercas','aaaaaaaaaaaaaa','1112348765',4),
(5,'mercados','dddddddddddddd','1121435678',5),
(6,'mercadito','tttttttttttttt','1112345678',6);


create table endereço(
idEndereco int primary key,
cep char (8) not null,  -- 8 digitos sem o ponto -> 12345678
rua varchar (50),
bairro varchar (50),
cidade varchar (50),
numero int, -- numero do imovel na rua 
uf char(2),
fkEstabelecimentoEndereço int,
foreign key (fkEstabelecimentoEndereço)
references estabelecimento (idEstabelecimento)
);

insert into endereço values
(1,'12345678','rua','bairro','santo andre',321,'sp',1),
(2,'87654321','ruazinha','bairrozinho','sao caetano',123,'sp',2),
(3,'43215678','ruazona','bairrao','sao bernardo',21,'sp',3),
(4,'12348765','ruassa','bairrasso','maua',12,'sp',4),
(5,'21435867','ruas','bairros','ribeirao preto',31,'sp',5),
(6,'43568271','ruinha','bairrinho','osasco',23,'sp',6);


create table responsavel(
idResponsavel int primary key,
nomeResponsavel varchar (20),
celular char (11),  -- com ddd e 9 mas sem hifen  e parenteses -> 11912345678
fkEstabelecimentoResponsavel int,
foreign key (fkEstabelecimentoResponsavel)
references estabelecimento(idEstabelecimento)
); 

insert into responsavel values
(1,'richard','11912345678',1),
(2,'isabela','11943215678',2),
(3,'arthur','11912348765',3),
(4,'guilherme','11912654378',4),
(5,'joao','11912348765',5),
(6,'renan','11921435678',6);


create table sensor(
idSensor int primary key,
dataLeitura datetime,  
	/*juntei os campos data_leitura, hora_leitura e dia_semana em um só
	existia uma constraint para inserir o dia da semana (segunda a domingo)
	*/
corredor int,
fkEstabelecimentoSensor int,
foreign key (fkEstabelecimentoSensor)
references estabelecimento(idEstabelecimento)
);

insert into sensor values
(1,'2025-04-01 17:15:00',2,1),
(2,'2025-05-02 18:16:00',3,2),
(3,'2025-06-03 19:17:00',5,3),
(4,'2025-07-04 20:18:00',1,4),
(5,'2025-08-05 21:19:00',3,5),
(6,'2025-08-06 16:20:00',4,6);

select cliente.nome as NomeCliente,
estabelecimento.nomeEstabelecimento as NomeEstabelecimento,
sensor.idSensor as Sensor,
sensor.dataLeitura as DataDaLeitura,
responsavel.nomeResponsavel as ResponsavelDoEstabelecimento,
endereço.rua as Rua,
endereço.cidade as Cidade
from cliente join estabelecimento
on idCliente = fkCliente
join sensor 
on idEstabelecimento = fkEstabelecimentoSensor
join responsavel
on idEstabelecimento = fkEstabelecimentoResponsavel
join endereço
on idEstabelecimento = fkEstabelecimentoEndereço;



