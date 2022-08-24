unit uPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, uDTMConexao, Enter;

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
    procedure mnuFecharClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure CATEGORIA1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    TeclaEnter: TMREnter;
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

uses uCadCategoria;

procedure TfrmPrincipal.CATEGORIA1Click(Sender: TObject);
begin
  frmCadCategoria:=TfrmCadCategoria.Create(Self);
  frmCadCategoria.ShowModal;
  frmCadCategoria.Release;
end;

procedure TfrmPrincipal.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FreeAndNil(TeclaEnter);
  FreeAndNil(dtmPrincipal);
end;

procedure TfrmPrincipal.FormCreate(Sender: TObject);
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

  dtmPrincipal := TdtmPrincipal.Create(Self);
  with dtmPrincipal.ConexaoDB do
  begin
    SQLHourGlass:=True;
    Protocol := 'mssql';
    LibraryLocation:='D:\Cursos\Delphi\Delphi_sistema\ntwdblib.dll';
    HostName:='.\SERVERCURSO';
    Port:=1433;
    user:='sa';
    Password:='rt6666';
    Database:='vendas';
    Connected:=True;
  end;

  TeclaEnter:=TMREnter.Create(self);
  TeclaEnter.FocusEnabled:=true;
  TeclaEnter.FocusColor:=clInfoBk;


end;

procedure TfrmPrincipal.mnuFecharClick(Sender: TObject);
begin
  // Close;
  Application.Terminate;
end;

end.
