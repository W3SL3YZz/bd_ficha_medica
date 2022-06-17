/*NOMES: 
WESLEY WILLIAN GOULART RM:08684
GABRIEL JOSE RM: 08447 */

create database db_ficha_medica;

use db_ficha_medica;

create table if not exists tb_uf(
cd_uf int not null,
sg_uf char(2),
constraint pk_uf
	primary key(cd_uf));
    
create table if not exists tb_medico(
cd_medico int not null,
nm_medico varchar(80),
cd_crm char(6),
constraint pk_medico
	primary key(cd_medico)
);

create table if not exists tb_convenio(
cd_convenio int not null,
nm_convenio varchar(30),
constraint pk_convenio
	primary key(cd_convenio)
);

create table if not exists tb_estado_civil(
cd_estado_civil int not null,
nm_estado_civil varchar(25),
constraint pk_estado_civil
	primary key (cd_estado_civil)
);

create table if not exists tb_cidade(
cd_cidade int not null,
nm_cidade varchar(45),
cd_uf int,
constraint pk_cidade
	primary key(cd_cidade),
constraint fk_cidade_uf
	foreign key (cd_uf)
		references tb_uf(cd_uf)
);

create table if not exists tb_bairro(
cd_bairro int not null,
nm_bairro varchar (45),
cd_cidade int,
constraint pk_bairro
	primary key(cd_bairro),
constraint fk_bairro_cidade
	foreign key(cd_cidade)
		references tb_cidade(cd_cidade)
);

create table if not exists tb_paciente(
cd_paciente int not null,
nm_paciente varchar(80),
dt_nascimento date,
nm_sexo enum('Masculino', 'Feminino', 'Indefinido'),
cd_rg varchar(11),
cd_convenio int,
cd_estado_civil int,
nm_endereco varchar(100),
cd_cep char(8),
cd_bairro int,
constraint pk_paciente
	primary key(cd_paciente),
constraint fk_paciente_convenio
	foreign key(cd_convenio)
		references tb_convenio(cd_convenio),
constraint fk_paciente_estado_civil
	foreign key(cd_estado_civil)
		references tb_estado_civil(cd_estado_civil),
constraint fk_paciente_bairro
	foreign key(cd_bairro)
		references tb_bairro(cd_bairro)
);

create table if not exists tb_consulta(
cd_consulta int not null,
dt_consulta date,
hr_consulta time,
cd_medico int,
cd_paciente int,
nm_diagnostico varchar(45),
ds_obs text,
constraint pk_consulta
	primary key(cd_consulta),
constraint fk_consulta_medico
	foreign key(cd_medico)
		references tb_medico(cd_medico),
constraint fk_consulta_paciente
	foreign key(cd_paciente)
		references tb_paciente(cd_paciente)
);

create table if not exists tb_exame(
cd_exame int not null,
cd_consulta int,
nm_exame varchar(45),
dt_exame date,
ds_obs varchar(45),
constraint pk_exame
	primary key(cd_exame),
constraint fk_exame_consulta
	foreign key(cd_consulta)
		references tb_consulta(cd_consulta)
);

create table if not exists tb_contato(
cd_contato int not null,
cd_telefone varchar(11),
cd_paciente int,
ds_contato varchar(100),
constraint pk_contato
	primary key(cd_contato),
constraint fk_contato_paciente
	foreign key(cd_paciente)
		references tb_paciente(cd_paciente));
        
show tables;