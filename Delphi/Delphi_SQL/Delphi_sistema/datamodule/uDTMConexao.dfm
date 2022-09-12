object dtmPrincipal: TdtmPrincipal
  OldCreateOrder = False
  Height = 369
  Width = 483
  object ConexaoDB: TZConnection
    ControlsCodePage = cCP_UTF16
    AutoEncodeStrings = True
    Catalog = ''
    Properties.Strings = (
      'controls_cp=CP_UTF16'
      'AutoEncodeStrings=True')
    TransactIsolationLevel = tiReadCommitted
    Connected = True
    SQLHourGlass = True
    HostName = '.\SERVERCURSO'
    Port = 0
    Database = 'vendas'
    User = 'sa'
    Password = 'rt6666'
    Protocol = 'mssql'
    LibraryLocation = 'D:\Cursos\Delphi\Delphi_sistema\ntwdblib.dll'
    Left = 32
    Top = 48
  end
  object QryScriptCategorias: TZQuery
    Connection = ConexaoDB
    SQL.Strings = (
      'IF OBJECT_ID ('#39'categoria'#39') IS NULL'
      'BEGIN'
      '  CREATE TABLE categoria('
      '    categoriaId int IDENTITY(1,1) NOT NULL,'
      '    descricao varchar(30) NULL,'
      '    PRIMARY KEY (categoriaId)'
      ')'
      'END')
    Params = <>
    Left = 168
    Top = 56
  end
  object QryScriptClientes: TZQuery
    Connection = ConexaoDB
    SQL.Strings = (
      'IF OBJECT_ID ('#39'clientes'#39') IS NULL'
      'BEGIN'
      'CREATE TABLE clientes('
      #9'clienteId int IDENTITY(1,1) NOT NULL,'
      #9'nome varchar(60) NULL,'
      #9'endereco varchar(60) NULL,'
      #9'cidade varchar(50) NULL,'
      #9'bairro varchar(40) NULL,'
      #9'estado varchar(2) NULL,'
      #9'cep varchar(10) NULL,'
      #9'telefone varchar(14) NULL,'
      #9'email varchar(100) NULL,'
      #9'dataNascimento datetime NULL,'
      #9'PRIMARY KEY (clienteId),'
      #9')'
      'END')
    Params = <>
    Left = 288
    Top = 48
  end
  object QryScriptProdutos: TZQuery
    Connection = ConexaoDB
    SQL.Strings = (
      'IF OBJECT_ID ('#39'produtos'#39') IS NULL'
      'BEGIN'
      'CREATE TABLE produtos('
      #9'produtoId int IDENTITY(1,1) NOT NULL,'
      #9'nome varchar(60) null,'
      #9'descricao varchar(255) null,'
      #9'valor decimal(18,5) default 0.00000 null,'
      #9'quantidade decimal(18,5) default 0.00000 null,'
      #9'categoriaId int null,'
      #9'primary key (produtoId),'
      #9'CONSTRAINT FK_ProdutosCategorias'
      #9'FOREIGN KEY (categoriaId) references categoria(categoriaId)'
      #9')'
      'END')
    Params = <>
    Left = 400
    Top = 48
  end
  object QryScriptVendas: TZQuery
    Connection = ConexaoDB
    SQL.Strings = (
      'IF OBJECT_ID('#39'vendas'#39') IS NULL'
      'BEGIN'
      'Create table vendas('
      #9'vendaId int identity(1,1) not null,'
      #9'clienteId int not null,'
      #9'dataVenda datetime default getdate(),'
      #9'totalVenda decimal(18,5) default 0.00000,'
      ''
      #9'PRIMARY KEY (vendaId),'
      #9'CONSTRAINT FK_VendasClientes FOREIGN KEY (clienteId)'
      #9#9'REFERENCES clientes (clienteId)'
      ')'
      'END')
    Params = <>
    Left = 176
    Top = 128
  end
  object QryScriptItensVenda: TZQuery
    Connection = ConexaoDB
    SQL.Strings = (
      'IF OBJECT_ID('#39'vendasItens'#39') IS NULL'
      'BEGIN'
      'Create table vendasItens('
      #9'vendaId int not null,'
      #9'produtoId int not null,'
      #9'valorUnitario decimal (18,5) default 0.00000,'
      #9'quantidade decimal (18,5) default 0.00000,'
      #9'totalProduto decimal (18,5) default 0.00000,'
      #9'PRIMARY KEY (vendaId,produtoId),'
      #9'CONSTRAINT FK_VendasItensProdutos FOREIGN KEY (produtoId)'
      #9#9'REFERENCES produtos(produtoId)'
      ')'
      'END')
    Params = <>
    Left = 288
    Top = 120
  end
  object QryScriptUsuarios: TZQuery
    Connection = ConexaoDB
    SQL.Strings = (
      'IF OBJECT_ID ('#39'usuarios'#39') IS NULL'
      'BEGIN'
      #9'Create table usuarios ('
      #9#9'usuarioId int Identity(1,1) not null,'
      #9#9'nome varchar (50) not null,'
      #9#9'senha varchar(40) not null,'
      ''
      #9#9'Primary Key (usuarioId),'
      ')'
      'END')
    Params = <>
    Left = 400
    Top = 112
  end
end
