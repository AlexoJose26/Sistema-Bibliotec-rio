create database gestao_bibliotecaria;
use gestao_bibliotecaria;

create table if not exists pessoa(
	bi char(14) primary key,
	nome varchar(150) not null,
	data_nascimento date,
	sexo enum("M","F") not null
);

 insert into pessoa values('008086925MO046','Alexo José','2001-12-26','M'),
 ('002543730MO036','Emília Francisco','1987-12-28','F'),
 ('007273533LA034','Elídio Francisco','2012-12-16','M'),
 ('008573634MO056','Filomena Bonifácio','2004-12-16','F'),
 ('007563122LA061','Ana Francisco','2010-12-20','F'),
 ('002573432LA045','Graça Francisco','2016-12-12','M'),
 ('009370831MO022','Sónia Bonifácio','2007-06-16','F'),
 ('001530830LA026','Emy Francisco','2020-05-08','F'),
 ('005503834MO035','Víctor da Costa','2001-12-24','M'),
 ('008513037MO043','Berone Lussaca','2001-08-17','M');
 
select * from pessoa;
 
create table if not exists livro(
	codigo int primary key auto_increment,
	titulo varchar(100) not null,
    ISBN char(15)
 );
 
 insert into livro values(1,'A Grande Esperança',' 9788534524001'),
 (2,'O Homem mais Rico do País',' 38834620801'),
 (3,'Atitudes',' 7085360241'),
 (4,'O Poder do Hábito',' 82534524301'),
 (5,'O Amor de Mãe',' 534524011'),
 (6,'As 100 Frases de Luther King',' 2534524'),
 (7,'A Diferença entre Estudante e Aluno',' 1748534522'),
 (8,'Como Convenser Alguém em 90 Segundos',' 48853451'),
 (9,'Cem Maneiras de se Motivar',' 61853452400'),
 (10,'O Vendedor de Sonhos',' 9534524444'),
 (11,'OS 8 Passos',' 75345243301'),
 (12,'O Semeador de Ideas',' 10534524001'),
 (13,'As 25 Leis Bíblicas','9088534524001'),
 (14,'A Esperança da Juventude',' 808534524001'),
 (15,'O Grande Amor',' 1788534524001'),
 (16,'Visão para o Futuro',' 798534524001'),
 (17,'O Amor Incondicional',' 5588534524001'),
 (18,'O Maior Erro da Entrega Total entre Amizades',' 88534524001'),
 (19,'O Problema da Depressão',' 285345201'),
 (20,'Dependência Financeira',' 5578853452401'),
 (21,'O Choro de um Povo',' 278853452401'),
 (22,'A Fome e a Pobreza',' 17885345240'),
 (23,'A Juventude Deprimida',' 58853452401'),
 (24,'O Mercado Financeiro',' 3788534524'),
 (25,'Como Fazer uma boa Gestão do Dinheiro',' 685345241');
 
 select * from livro;
 
 
 create table if not exists autor(
	id_autor int primary key auto_increment,
	nome varchar(150)not null,
	bi char(14)not null
 );
 
 insert into autor values(1,'Alexo José','008086925MO046');
 
 
select autor.nome as Autor,
autor.bi as BI,
autor.id_autor as ID,
livro.codigo as Código,
livro.titulo as Título,
livro.ISBN as ISBN

from livro join autor on autor.id_autor = livro.codigo order by autor.nome;
 select * from autor;
 
 
 create table if not exists livro_autor(
	codigo int,
    id_autor int,
    foreign key (codigo) references livro(codigo),
	foreign key (id_autor) references autor(id_autor)
);
     
     
create table if not exists estudante(
	bi char(14) primary key,
	turma char(8) not null,
	ano_academico enum("1","2","3","4","5"),
	foreign key (bi) references pessoa(bi)
);

insert into estudante values('008086925MO046','A','3');

select pessoa.nome as Nome,
estudante.bi as BI,
pessoa.data_nascimento as 'Data',
pessoa.sexo as Género,
estudante.turma as Turma,
estudante.ano_academico as Ano

from pessoa join estudante on estudante.bi = pessoa.bi order by pessoa.nome;
select * from estudante;


create table if not exists professor(
	bi char(14) primary key,
	ano_experiencia int not null,
	foreign key (bi) references pessoa(bi)
	on update cascade
	on delete cascade
);

insert into professor values('008513037MO043',4);

select pessoa.nome as Nome,
professor.bi as BI,
pessoa.data_nascimento as 'Data',
pessoa.sexo as Género,
professor.ano_experiencia as Experiencia

from pessoa join professor on professor.bi = pessoa.bi order by pessoa.nome;
select * from professor;        
        
        
create table if not exists emprestimo(
	data_rececao date,
	data_devolucao date,
	codigo int,
	bi char(14),
    primary key (bi,codigo),
	foreign key (bi) references pessoa(bi),
	foreign key (codigo) references livro(codigo)
	);  
    
insert into emprestimo values('2024-03-12','2024-08-26',1,'008513037MO043'),
 ('2024-01-02','2024-09-16',2,'008086925MO046'),
 ('2024-02-05','2024-10-10',3,'002543730MO036'),
 ('2024-03-12','2024-11-02',4,'007273533LA034'),
 ('2024-03-12','2024-03-26',5,'008573634MO056'),
 ('2024-04-02','2024-04-12',6,'007563122LA061'),
 ('2024-04-02','2024-04-10',7,'002573432LA045'),
 ('2024-04-04','2024-04-06',8,'009370831MO022'),
 ('2024-04-12','2024-04-26',9,'001530830LA026'),
 ('2024-05-12','2024-05-26',10,'005503834MO035'),
 ('2024-05-20','2024-05-22',11,'008513037MO043'),
 ('2024-05-21','2024-05-24',12,'007273533LA034'),
 ('2024-06-02','2024-06-06',13,'008086925MO046'),
 ('2024-06-14','2024-06-16',14,'009370831MO022'),
 ('2024-06-17','2024-06-19',15,'007563122LA061'),
 ('2024-06-18','2024-06-20',16,'007273533LA034'),
 ('2024-07-01','2024-07-02',17,'002543730MO036'),
 ('2024-07-05','2024-07-07',18,'007273533LA034'),
 ('2024-07-10','2024-07-15',19,'008513037MO043'),
 ('2024-07-25','2024-07-28',20,'002573432LA045'),
 ('2024-08-11','2024-08-13',21,'008086925MO046'),
 ('2024-08-16','2024-08-17',22,'005503834MO035'),
 ('2024-08-23','2024-08-25',23,'009370831MO022'),
 ('2024-09-07','2024-09-09',24,'008513037MO043'),
 ('2024-11-11','2024-11-12',25,'008513037MO043');
 
 select * from emprestimo;   


