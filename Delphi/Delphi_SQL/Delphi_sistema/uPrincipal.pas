unit uPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, uDTMConexao, Enter,
  Vcl.StdCtrls, Vcl.ExtCtrls, uFrmAtualizaDB, uAlterarSenha, cUsuarioLogado, ZDbcIntfs,
  Vcl.ComCtrls, cAtualizacaoBancoDeDados, cArquivoIni, zDataset;

type
  TfrmPrincipal = class(TForm)
    mainPrincipal: TMainMenu;
    CADASTRO1: TMenuItem;
    MOVIMENTAO1: TMenuItem;
    RELATRIO1: TMenuItem;
    CLIENTE1: TMenuItem;
    CLIENTE2: TMenuItem;
    CATEGORIA1: TMenuItem;
    CATEGORIA2: TMenuItem;
    N1: TMenuItem;
    mnuFechar: TMenuItem;
    VENDAS1: TMenuItem;
    CLIENTE3: TMenuItem;
    CLIENTE4: TMenuItem;
    PRODUTO1: TMenuItem;
    PRODUTO2: TMenuItem;
    VENDA1: TMenuItem;
    CATEGORIA3: TMenuItem;
    FICHADECLIENTE1: TMenuItem;
    USURIO1: TMenuItem;
    N2: TMenuItem;
    ALTERARSENHA1: TMenuItem;
    stpPrincipal: TStatusBar;
    procedure mnuFecharClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure CATEGORIA1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CLIENTE1Click(Sender: TObject);
    procedure CATEGORIA2Click(Sender: TObject);
    procedure VENDAS1Click(Sender: TObject);
    procedure CATEGORIA3Click(Sender: TObject);
    procedure CLIENTE3Click(Sender: TObject);
    procedure FICHADECLIENTE1Click(Sender: TObject);
    procedure USURIO1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ALTERARSENHA1Click(Sender: TObject);
    procedure PRODUTO1Click(Sender: TObject);
    procedure VENDA1Click(Sender: TObject);
  private
    { Private declarations }
    TeclaEnter: TMREnter;
    procedure AtualizacaoBancoDados(aForm: TfrmAtualizaDB);
    procedure CriarBanco(dbname:string);
  public
    { Public declarations }
  end;


var
  frmPrincipal: TfrmPrincipal;
  oUsuarioLogado: TUsuarioLogado;

implementation

{$R *.dfm}

uses uCadCategoria, uCadCliente, uCadProduto, uProVenda, uRelCategoria, uRelCadCliente, uRelCadClienteFicha,
  uCadUsuario, uLogin, uRelCadProduto, uSelecionarData;

procedure TfrmPrincipal.CATEGORIA1Click(Sender: TObject);
begin
  frmCadCategoria:=TfrmCadCategoria.Create(Self);
  frmCadCategoria.ShowModal;
  frmCadCategoria.Release;
end;

procedure TfrmPrincipal.CATEGORIA2Click(Sender: TObject);
begin
   frmCadProduto:=TfrmCadProduto.Create(self);
   frmCadProduto.ShowModal;
   frmCadProduto.Release;
end;

procedure TfrmPrincipal.CATEGORIA3Click(Sender: TObject);
begin
  frmRelCategoria:=TfrmRelCategoria.Create(Self);
  frmRelCategoria.Relatorio.PreviewModal;
  frmRelCategoria.Release;
end;

procedure TfrmPrincipal.CLIENTE1Click(Sender: TObject);
begin

  try
    frmCadCliente:=TfrmCadCliente.Create(Self);
    frmCadCliente.ShowModal;  
  finally
    FreeAndNil(frmCadCliente);
  end;
//  frmCadCliente.Release;
end;

procedure TfrmPrincipal.CLIENTE3Click(Sender: TObject);
begin
  frmRelCadCliente:=TfrmRelCadCliente.Create(Self);
  frmRelCadCliente.Relatorio.PreviewModal;
  frmRelCadCliente.Release;

end;

procedure TfrmPrincipal.CriarBanco(dbname:string);
var Qry:TZQuery;
begin
  dtmPrincipal := TdtmPrincipal.Create(Self);
  with dtmPrincipal.ConexaoDB do
  begin

    // Retirar connected, coloquei para conectar em outra DB
    Connected:=False;
    SQLHourGlass:=False;
    if TArquivoIni.LerIni('SERVER', 'TipoDataBase')='MSSQL' then
      Protocol:='mssql';  // Protocolo do bando de dados

      LibraryLocation:=ExtractFilePath(Application.ExeName)+'ntwdblib.dll';  //Seta a DLL para conexao do SQL
      HostName:= TArquivoIni.LerIni('SERVER','HostName'); //Instancia do SQLServer
      Port    := StrToInt(TArquivoIni.LerIni('SERVER','Port'));  //Porta do SQL Server
      User    := TArquivoIni.LerIni('SERVER','User');  //Usuario do Banco de Dados
      Password:= TArquivoIni.LerIni('SERVER','Password');  //Senha do Usuário do banco

      AutoCommit:=True;
      TransactIsolationLevel:=tiReadCommitted;
      Connected:=True;
  end;

  try
    Qry:=TZQuery.Create(nil);
    Qry.Connection:=dtmPrincipal.ConexaoDB;
    Qry.SQL.Clear;
    Qry.SQL.Add('CREATE DATABASE '+dbname);
    Qry.ExecSQL;
  finally
    if Assigned(Qry) then
       FreeAndNil(Qry);
  end;
end;

procedure TfrmPrincipal.FICHADECLIENTE1Click(Sender: TObject);
begin

  frmRelCadClienteFicha:=TfrmRelCadClienteFicha.Create(Self);
  frmRelCadClienteFicha.Relatorio.PreviewModal;
  frmRelCadClienteFicha.Release;
end;

procedure TfrmPrincipal.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FreeAndNil(TeclaEnter);
  FreeAndNil(dtmPrincipal);

  if Assigned(oUsuarioLogado) then
    FreeAndNil(oUsuarioLogado);
end;



procedure TfrmPrincipal.FormCreate(Sender: TObject);
var
  loBanco:string;
begin
  {dtmPrincipal := TdtmPrincipal.Create(Self);
  dtmPrincipal.ConexaoDB.SQLHourGlass:=True;
  dtmPrincipal.ConexaoDB.Protocol := 'mssql';
  dtmPrincipal.ConexaoDB.LibraryLocation:='D:\Cursos\Delphi\Delphi_sistema\ntwdblib.dll';
  dtmPrincipal.ConexaoDB.HostName:='.\SERVERCURSO';
  dtmPrincipal.ConexaoDB.Port:=1433;
  dtmPrincipal.ConexaoDB.user:='sa';
  dtmPrincipal.ConexaoDB.Password:='rt6666';
  dtmPrincipal.ConexaoDB.Database:='vendas';
  dtmPrincipal.ConexaoDB.Connected:=True;}
 // conexao com DB
  if not FileExists(TArquivoIni.ArquivoIni) then
  begin
      TArquivoIni.AtualizarIni('SERVER', 'TipoDataBase', 'MSSQL');
      TArquivoIni.AtualizarIni('SERVER', 'HostName', '.\SERVERCURSO');
      TArquivoIni.AtualizarIni('SERVER', 'Port', '1433');
      TArquivoIni.AtualizarIni('SERVER', 'User', 'sa');
      TArquivoIni.AtualizarIni('SERVER', 'Password', 'rt6666');
      loBanco:= InputBox('NOME DO BANCO','Nome','******');
      TArquivoIni.AtualizarIni('SERVER', 'Database', loBanco);

      MessageDlg('Arquivo '+ TArquivoIni.ArquivoIni +
                 'Criado, Configure o arquivo antes de inicializar a aplicação', MtInformation,[mbok],0);
      CriarBanco(loBanco);
      Application.Terminate;
  end;


  frmAtualizaDB:=TfrmAtualizaDB.Create(Self);
  frmAtualizaDB.Show;
  frmAtualizaDB.Refresh;

  dtmPrincipal := TdtmPrincipal.Create(Self);
  with dtmPrincipal.ConexaoDB do
  begin

    // Retirar connected, coloquei para conectar em outra DB
    Connected:=False;
    SQLHourGlass:=False;
    if TArquivoIni.LerIni('SERVER', 'TipoDataBase')='MSSQL' then
      Protocol:='mssql';  // Protocolo do bando de dados

      LibraryLocation:=ExtractFilePath(Application.ExeName)+'ntwdblib.dll';  //Seta a DLL para conexao do SQL
      HostName:= TArquivoIni.LerIni('SERVER','HostName'); //Instancia do SQLServer
      Port    := StrToInt(TArquivoIni.LerIni('SERVER','Port'));  //Porta do SQL Server
      User    := TArquivoIni.LerIni('SERVER','User');  //Usuario do Banco de Dados
      Password:= TArquivoIni.LerIni('SERVER','Password');  //Senha do Usuário do banco
      Database:= TArquivoIni.LerIni('SERVER','DataBase');;  //Nome do Banco de Dados

    {LibraryLocation:='D:\Cursos\Delphi\Delphi_sistema\ntwdblib.dll'; ele tava dando certo por que tava ali mesmo
    HostName:='.\SERVERCURSO';
    Port:=1433;
    user:='sa';
    Password:='rt6666';
    //Database:='dbVendaTeste';
    Database:='vendas';}
      AutoCommit:=True;
      TransactIsolationLevel:=tiReadCommitted;
      Connected:=True;
  end;

  AtualizacaoBancoDados(frmAtualizaDB);
  frmAtualizaDB.Free;

  TeclaEnter:=TMREnter.Create(self);
  TeclaEnter.FocusEnabled:=true;
  TeclaEnter.FocusColor:=clInfoBk;


end;

procedure TfrmPrincipal.FormShow(Sender: TObject);
begin
  try
    oUsuarioLogado:=TUsuarioLogado.Create;
    frmLogin:=TfrmLogin.Create(Self);
    frmLogin.ShowModal;
  finally
    frmLogin.Release;
    stpPrincipal.Panels[0].Text:='USUÁRIO: '+oUsuarioLogado.nome;
  end;
end;

procedure TfrmPrincipal.ALTERARSENHA1Click(Sender: TObject);
begin
  frmAlterarSenha:=TfrmAlterarSenha.Create(self);
  frmAlterarSenha.ShowModal;
  frmAlterarSenha.Release;
end;

procedure TfrmPrincipal.AtualizacaoBancoDados(aForm:TfrmAtualizaDB);
var
  oAtualizarMSSQL: TAtualizaBancoDadosMSSQL;
begin
  aForm.Refresh;

  try
     oAtualizarMSSQL:=TAtualizaBancoDadosMSSQL.Create(dtmPrincipal.ConexaoDB);
     oAtualizarMSSQL.AtualizarBancoDeDadosMSSQL;
  finally
     if Assigned(oAtualizarMSSQL) then
        FreeAndNil(oAtualizarMSSQL);
  end;


   // Deixar em desuso para atualizar o método de banco de dados
   // Deixar salvo para estudo
  {DtmPrincipal.QryScriptCategorias.ExecSQL;
  aForm.chkCategoria.Checked:=true;
  aForm.Refresh;
  Sleep(100);

  DtmPrincipal.QryScriptClientes.ExecSQL;
  aForm.chkCliente.Checked:=true;
  aForm.Refresh;
  Sleep(100);

  DtmPrincipal.QryScriptProdutos.ExecSQL;
  aForm.chkProduto.Checked:=true;
  aForm.Refresh;
  Sleep(100);

  DtmPrincipal.QryScriptVendas.ExecSQL;
  aForm.chkVendas.Checked:=true;
  aForm.Refresh;
  Sleep(100);

  DtmPrincipal.QryScriptItensVenda.ExecSQL;
  aForm.chkItensVenda.Checked:=true;
  aForm.Refresh;
  Sleep(100);

  DtmPrincipal.QryScriptUsuarios.ExecSQL;
  aForm.chkUsuarios.Checked:=true;
  aForm.Refresh;
  Sleep(100);}


end;

procedure TfrmPrincipal.mnuFecharClick(Sender: TObject);
begin
  // Close;
  Application.Terminate;
end;

procedure TfrmPrincipal.PRODUTO1Click(Sender: TObject);
begin
  frmRelCadProduto:=TfrmRelCadProduto.Create(Self);
  frmRelCadProduto.Relatorio.PreviewModal;
  frmRelCadProduto.Release;
end;

procedure TfrmPrincipal.USURIO1Click(Sender: TObject);
begin
  frmCadUsuario:=TfrmCadUsuario.Create(self);
  frmCadUsuario.ShowModal;
  frmCadUsuario.Release;
end;

procedure TfrmPrincipal.VENDA1Click(Sender: TObject);
begin
  try
    frmSelecionarData:=TfrmSelecionarData.Create(Self);
    frmSelecionarData.ShowModal;
  finally
    frmSelecionarData.Release;
  end;
end;

procedure TfrmPrincipal.VENDAS1Click(Sender: TObject);
begin
  frmProVenda:=TfrmProVenda.Create(self);
  frmProVenda.ShowModal;
  frmProVenda.Release;
end;

end.
