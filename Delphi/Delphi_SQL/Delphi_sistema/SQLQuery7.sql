create database testeteste
vendas

use vendas

create table categoria (
	categoriaId integer not null identity primary key,
	descricao varchar(30) null	
	)

Insert Into categoria (descricao) Values ('Alimentação')
Insert Into categoria (descricao) Values ('Bazar'),('Brinquedo'),('Higiene')

SELECT * FROM categoria
SELECT categoriaId, 
		Descricao 
	FROM categoria
	-- WHERE categoriaId = 3 igual
	-- WHERE categoriaId <> 2 diferente
	-- WHERE categoriaId >2 maior que
	-- WHERE categoriaId >=2 maior e igual
	-- WHERE categoriaId IN(1,3) apenas selecionados
	-- WHERE categoriaId NOT IN (1,3) Não selecionados
	-- WHERE categoriaId Between 1 and 3 entre 2 valores
	-- WHERE Descricao = 'Bazar' OR categoriaId=4
	-- WHERE Descricao like '%a%'contem a string
	-- WHERE Descricao like 'a%' comece com a string
	-- WHERE Descricao like '%r' termine com a string

Update categoria SET descricao='Bazar' where categoriaId = 2

Delete from categoria where categoriaId = 2

Delete categoria -- Limpa categoria

Insert Into categoria (descricao) Values ('Notebook'),('Tablets'),('Roteadores'),('Periféricos')

DBCC CHECKIDENT ('Categoria' , RESEED,0); -- Reiniciar chaves identidade no SQL

sp_helpdb vendas -- informações 
sp_help categoria -- informações

SELECT * 
	FROM categoria
	order by categoriaId
SELECT * 
	FROM categoria
	order by categoriaId desc
SELECT * 
	FROM categoria
	order by descricao

SELECT * into #TEMP01
	from categoria -- criar tabela temporaria local na sessao atual
Select * from #TEMP01
Insert into #TEMP01 (descricao) values ('Teste temp')

SELECT * into ##TEMPGlobal -- criar tabela global, acessa em qualquer sessao
	from categoria
Select * from ##TEMPGlobal
Insert into ##TEMPGlobal (descricao) values ('Teste temp global')

drop table #TEMP01 -- deletar tabela temp
drop table ##TEMPGlobal -- deletar tabela temp

-- criar tabela temporaria outro metodo
create table #TESTE (
	campo1 int not null identity primary key,
	campo2 varchar(30) null
	 )
create table ##TESTE (
	campo1 int not null identity primary key,
	campo2 varchar(30) null
	 )
drop table #TESTE
drop table ##TESTE
 
Select * from #TESTE
Select * from ##TESTE

//

INSERT INTO categoria (descricao) values ('ABA - TESTE')
INSERT INTO categoria (descricao) values ('AAA - TESTE')
INSERT INTO categoria (descricao) values ('ABC - TESTE')

sp_help categoria

SELECT categoriaId, 
		Descricao 
	FROM categoria
  -- tabela clientes
CREATE TABLE clientes(
	clienteId int IDENTITY(1,1) NOT NULL,
	nome varchar(60) NULL,
	endereco varchar(60) NULL,
	cidade varchar(50) NULL,
	bairro varchar(40) NULL,
	estado varchar(2) NULL,
	cep varchar(10) NULL,
	telefone varchar(14) NULL,
	email varchar(100) NULL,
	dataNascimento datetime NULL,
	PRIMARY KEY (clienteId),
	)

select clienteId,
	nome,
	endereco,
	cidade,
	bairro,
	estado,
	cep,
	telefone,
	email,
	dataNascimento
from clientes

 -- tabela produtos
CREATE TABLE produtos(
	produtoId int IDENTITY(1,1) NOT NULL,
	nome varchar(60) null,
	descricao varchar(255) null,
	valor decimal(18,5) default 0.00000 null,
	quantidade decimal(18,5) default 0.00000 null,
	categoriaId int null,
	primary key (produtoId),
	CONSTRAINT FK_ProdutosCategorias
	FOREIGN KEY (categoriaId) references categoria(categoriaId)
	)

SELECT	p.produtoId,
		p.nome,
		p.descricao,
		p.valor,
		p.quantidade,
		p.categoriaId,
		c.descricao As DescricaoCategoria
FROM produtos as p
	LEFT JOIN categoria as c on c.categoriaId=p.categoriaId

SELECT		produtos.produtoId,
	    	produtos.Nome,
	    	produtos.Valor,
			produtos.descricao,
	    	produtos.Quantidade
FROM produtos
Order by Nome


-- Tabela vendas
IF OBJECT_ID('vendas') IS NULL
BEGIN
Create table vendas(
	vendaId int identity(1,1) not null,
	clienteId int not null,
	dataVenda datetime default getdate(),
	totalVenda decimal(18,5) default 0.00000,

	PRIMARY KEY (vendaId),
	CONSTRAINT FK_VendasClientes FOREIGN KEY (clienteId)
		REFERENCES clientes (clienteId)
)
END

SELECT vendas.vendaId
		,vendas.clienteId
		,clientes.nome
		,vendas.dataVenda
		,vendas.totalVenda
	From vendas
	Inner join clientes on clientes.clienteId=vendas.clienteId

-- Tabela Itens
IF OBJECT_ID('vendasItens') IS NULL
BEGIN
Create table vendasItens(
	vendaId int not null,
	produtoId int not null,
	valorUnitario decimal (18,5) default 0.00000,
	quantidade decimal (18,5) default 0.00000,
	totalProduto decimal (18,5) default 0.00000,
	PRIMARY KEY (vendaId,produtoId),
	CONSTRAINT FK_VendasItensProdutos FOREIGN KEY (produtoId)
		REFERENCES produtos(produtoId)
)
END

SELECT OBJECT_ID('vendas2') IS NULL

SELECT * from vendasItens
SELECT * from vendas
SELECT * from produtos

delete from vendasItens
delete from vendas
DBCC CHECKIDENT('vendas', RESEED, 0)

-- Tabela usuarios
IF OBJECT_ID ('usuarios') IS NULL
BEGIN
	Create table usuarios (
		usuarioId int Identity(1,1) not null,
		nome varchar (50) not null,
		senha varchar(40) not null,

		Primary Key (usuarioId),
)
END

Select OBJECT_ID ('usuarios')

Select * from usuarios
drop table usuarios

SELECT		usuarioId,
			nome,
			senha
	FROM usuarios

SELECT Count (usuarioId) AS Qtde
From usuarios
Where nome:='ADMIN' AND senha:='987Fxgj{s'
-- 987Fxgj{s == mudar@123

Delete From usuarios
DBCC CHECKIDENT ('usuarios', RESEED, 0)
Insert Into usuarios (nome, Senha) Values ('ADMIN', '987Fxgj{s')

Select OBJECT_ID ('usuarios') As ID


-- Criando tabelas dentro do delphi

Create DataBase dbVendaTeste

Select * from categoria

SELECT Count(Column_name) as Qtde
	From INFORMATION_SCHEMA.COLUMNS
	Where TABLE_NAME = 'Categoria'
	And COLUMN_NAME= 'teste'
