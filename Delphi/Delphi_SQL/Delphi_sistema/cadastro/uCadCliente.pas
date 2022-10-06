unit uCadCliente;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uTelaHeranca, Data.DB,
  ZAbstractRODataset, ZAbstractDataset, ZDataset, Vcl.DBCtrls, Vcl.Grids,
  Vcl.DBGrids, Vcl.StdCtrls, Vcl.Buttons, Vcl.Mask, Vcl.ExtCtrls, Vcl.ComCtrls,
   RxToolEdit, uEnum, cCadCliente, StdCtrls, ExtCtrls, DB, DBCtrls, Grids,
  DBGrids, Buttons, Mask, Controls, ComCtrls, Classes;
type
  TfrmCadCliente = class(TfrmTelaHeranca)
    QryListagemclienteId: TIntegerField;
    QryListagemnome: TWideStringField;
    QryListagemendereco: TWideStringField;
    QryListagemcidade: TWideStringField;
    QryListagembairro: TWideStringField;
    QryListagemestado: TWideStringField;
    QryListagemcep: TWideStringField;
    QryListagemtelefone: TWideStringField;
    QryListagememail: TWideStringField;
    QryListagemdatanascimento: TDateTimeField;
    edtClienteId: TLabeledEdit;
    edtEndereco: TEdit;
    edtCidade: TEdit;
    edtBairro: TEdit;
    edtEmail: TEdit;
    edtCEP: TMaskEdit;
    Label1: TLabel;
    edtTelefone: TMaskEdit;
    edtDataNascimento: TDateEdit;
    edtNome: TEdit;
    lbl1: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnNovoClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);

  private
     { Private declarations }
    oCliente:TCliente;
    function Apagar:Boolean; override;
    function Gravar(EstadoDoCadastro:TEstadoDoCadastro):Boolean; override;

  public
     { Public declarations }
 end;
 var
  frmCadCliente: TfrmCadCliente;

implementation

uses
  uDTMConexao, uFuncaoCriptografia;

{$R *.dfm}


{ TfrmCadCliente }

function TfrmCadCliente.Apagar: Boolean;
begin
  if oCliente.Selecionar(QryListagem.FieldByName('clienteId').AsInteger) then
  begin
     Result:=oCliente.Apagar;
  end;
end;

procedure TfrmCadCliente.btnAlterarClick(Sender: TObject);
begin
  if oCliente.Selecionar(QryListagem.FieldByName('clienteId').AsInteger) then
  begin
     edtClienteId.Text:=IntToStr(oCliente.codigo);
     edtNome.Text     :=oCliente.nome;
     edtCEP.Text      :=oCliente.cep;
     edtEndereco.Text :=oCliente.endereco;
     edtBairro.Text   :=oCliente.bairro;
     edtCidade.Text   :=oCliente.cidade;
     edtTelefone.Text :=oCliente.telefone;
     edtEmail.Text    :=oCliente.email;
     edtDataNascimento.Date:=oCliente.dataNascimento;

  end
  else
  begin
    btnCancelar.Click;
    Abort;
  end;
  inherited;
end;

procedure TfrmCadCliente.btnNovoClick(Sender: TObject);
begin
  inherited;
  edtDataNascimento.Date;
  edtNome.SetFocus;
end;

procedure TfrmCadCliente.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  if Assigned(oCliente) then
     FreeAndNil(oCliente);
end;

procedure TfrmCadCliente.FormCreate(Sender: TObject);
begin
  inherited;
  oCliente:=TCliente.Create(dtmPrincipal.ConexaoDB);
  IndiceAtual:='nome';
end;

function TfrmCadCliente.Gravar(EstadoDoCadastro: TEstadoDoCadastro): Boolean;
begin
  if edtClienteId.Text<>EmptyStr then
     oCliente.codigo:=StrToInt(edtClienteId.Text)
  else
     oCliente.codigo:=0;

  oCliente.nome           :=edtNome.Text;
  oCliente.cep            :=edtCEP.Text;
  oCliente.endereco       :=edtEndereco.Text;
  oCliente.bairro         :=edtBairro.Text;
  oCliente.cidade         :=edtCidade.Text;
  oCliente.telefone       :=edtTelefone.Text;
  oCliente.email          :=edtEmail.Text;
  oCliente.dataNascimento :=edtDataNascimento.Date;

  if (EstadoDoCadastro=ecInserir) then
     Result:=oCliente.Inserir
  else if (EstadoDoCadastro=ecAlterar) then
     Result:=oCliente.Atualizar;
end;

end.
