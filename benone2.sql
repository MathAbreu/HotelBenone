Create database HotelBenone;
use HotelBenone;


CREATE TABLE Cliente (
Id_cliente int not null auto_increment,
NomeCliente varchar (100),
CPF varchar (20), 
RG varchar (20),
Sexo varchar(1), 
Data_nasc date, 
Id_Quarto int not null, 
Constraint PK_cliente primary key (Id_cliente), 
constraint FK_IdQuarto foreign key (Id_Quarto) references Quartos (Id_Quarto)
);
CREATE TABLE ClienteEnd(
Id_cliente int not null, 
endereco varchar(100), 
telefone_Residencial varchar(14), 
telefone_celular varchar(14),
constraint pk_clienteEnd primary key (endereco),
constraint fk_IdCliente foreign key (id_cliente) references cliente (id_cliente)
);

CREATE TABLE Funcionario(
Id_Funcionario int not null auto_increment, 
Nome_funcionario varchar (50),
Id_reserva int not null,  
constraint PK_funcionario primary key (Id_funcionario),
constraint FK_IdReserva foreign key (Id_reserva) references reserva (Id_reserva)
);

Create table Quartos(
Id_Quarto int not null,
Id_tipoQuarto varchar (20),
Id_padraoQuarto varchar(20),
Data_disp date,
taxa decimal (3, 2),
status_q varchar(20),
constraint pk_Quarto primary key (Id_quarto), 
constraint fk_Idtipo_Quarto foreign key (Id_tipoQuarto) references tipoQuarto(Id_tipoQuarto),
constraint fk_Idpadrão foreign key (Id_padraoQuarto) references padrao(Id_padraoQuarto)
);

create table TipoQuarto(
Id_tipoQuarto varchar(15) not null, 
descrição varchar(30), 
constraint pk_tipoQuarto primary key (Id_tipoQuarto)
);
create table padrao(
Id_padraoQuarto varchar (20) not null, 
descrição varchar (30),
constraint pk_padraoQuarto primary key (Id_padraoQuarto)
);

create table reserva(
Id_reserva int not null,
Id_cliente int not null,
Id_quarto int not null, 
Id_tipoQuarto varchar(15),
Id_padraoQuarto varchar (20), 
data_entrada date, 
data_saida date, 
Num_pessoas int, 

constraint pk_Id_reserva primary key (Id_reserva),
constraint fk_ID_cliente foreign key(id_cliente) references cliente(id_cliente),
constraint fk_Id_quarto foreign key (Id_quarto) references Quartos (Id_quarto), 
constraint fk_Id_tipo_Quarto foreign key (Id_tipoQuarto) references TipoQuarto (Id_tipoQuarto),
constraint fk_id_padrao_quarto foreign key (Id_padraoQuarto) references padrao (Id_padraoQuarto)
);


insert into cliente values (NULL, "Iago Benone da Silva", "122.323.878.02", "47.250.541-5", "M", '2001-01-23', '2');
insert into cliente values (NULL, "Matheus Antônio Barreto de Abreu", "933.755.380-57", '11.935.618-1', "M", '1999-02-22', '3');
insert into cliente values (NULL, "Mariana Alves de Queiroz", "919.430.980-93", "23.760.337-8", "F", '1998-05-14', '4');
insert into cliente values (NULL, "Maíra de França Nunes", "641.253.270-68", "22.314.990-1", "F", '1999-03-02', '1');

insert into clienteEnd values (1, "Av. prefeito Diomedes F. de Melo", "(81)35243787","(81)99889-6754");
insert into clienteEnd values (2, "Av. Bernardo Vieira de Melo", "(81)3854-2334","(81)99999-6265");
insert into clienteEnd values (3, "Av. Presidente Kennedy", "(81)37243485","(81)99849-6552");
insert into clienteEnd values (4, "Cajueiro Seco", "(81)38243280","(81)99819-5764");

insert into funcionario values(NULL, "Huguinho", 1);
insert into funcionario values(NULL, "Zezinho", 2);
insert into funcionario values(NULL, "Luizinho", 3);
insert into funcionario values(NULL, "Donald", 4);
insert into funcionario values(NULL, "Tio patinhas", 5);
insert into funcionario values(NULL, "Margarida", 6);
insert into funcionario values(NULL, "Pateta", 7);

insert into quartos values(1, "simples", "Standard",'2019-11-26','20.00' ,"Ocupado");
insert into quartos values(2, "Duplo", "Suite", '2019-12-11','40.00', "ocupado");
insert into quartos values(3, "Triplo", "Luxo", '2019-11-26','80.00', "ocupado");
insert into quartos values(4, "Quadruplo", "Master", '2019-12-01','100.00' ,"ocupado");
insert into quartos values(5, "simples", "Standard",'2019-11-10','20.00' ,"disponivel");
insert into quartos values(6, "simples", "Standard",'2019-11-20','20.00', "disponivel");
insert into quartos values(7, "Duplo", "Suite", '2019-11-11','40.00', "disponivel");
insert into quartos values(8, "Triplo", "Luxo", '2019-11-11', '80.00',"disponivel");
insert into quartos values(9, "Quadruplo", "Master", '2019-11-11','100.00', "ocupado");

insert into tipoquarto values("Simples", "...");
insert into tipoquarto values("Duplo", "...");
insert into tipoquarto values("Triplo","..."); 
insert into tipoquarto values("Quadruplo", "...");

insert into padrao values("standard", "...");
insert into padrao values("Suite", "...");
insert into padrao values("Luxo","...");
insert into padrao values("Master", "...");

insert into reserva values(1, 2, 3, "triplo", "Luxo", '2019-11-19', '2019-11-25', '2');
insert into reserva values(2, 1, 4, "quadruplo","Master", '2019-11-20', '2019-11-30', '3');
insert into reserva values(3, 3, 2, "Duplo", "suite", '2019-11-30', '2019-12-10', '2');
insert into reserva values(4, 4, 1, "simples", "standard", '2019-11-08', '2019-11-17', '1');
insert into reserva values(5, 3, 3, "triplo", "Luxo", '2019-11-30', '2019-12-10', '2');
insert into reserva values(6, 4, 1, "simples", "standard", '2019-11-30', '2019-12-07', '1');
insert into reserva values(7, 1, 9, "Quadruplo", "master", '2019-11-12', '2019-11-15', '4');
insert into reserva values(8, 4, 5, "simples", "standard", '2019-11-22', '2019-12-07', '2');
insert into reserva values(9, 4, 9, "quadruplo", "master", '2019-11-01', '2019-11-10', '2');
-- select

-- select quartos disponiveis no dia de hoje
select quartos.id_quarto, quartos.id_tipoquarto, quartos.id_padraoQuarto from quartos where data_disp = '2019-11-11' and status_q = "disponivel";
-- quartos simples disponiveis
select quartos.id_quarto, quartos.id_tipoquarto from quartos inner join reserva on reserva.id_quarto = quartos.id_quarto where reserva.Id_tipoquarto = "simples" and data_saida = '2019-12-07';
-- quartos disponiveis 
select quartos.Id_Quarto, quartos.Id_tipoQuarto from reserva inner join Quartos on reserva.Id_Quarto = Quartos.Id_Quarto where data_saida = '2019-12-10';
-- ocupado
select cliente.nomecliente, id_reserva from reserva inner join Cliente on reserva.id_cliente = Cliente.id_cliente where data_entrada = '2019-11-08';
-- Funcionario reserva
select nome_funcionario from funcionario inner join reserva on funcionario.id_reserva = reserva.Id_reserva where reserva.Id_reserva = '1';
-- Quartos ocupados no dia de hoje
select Id_cliente, quartos.Id_tipoQuarto, id_reserva from reserva inner join Quartos on reserva.Id_quarto = Quartos.Id_Quarto where data_entrada = '2019-11-08';