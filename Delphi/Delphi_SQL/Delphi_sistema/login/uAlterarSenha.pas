unit uAlterarSenha;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons;

type
  TfrmAlterarSenha = class(TForm)
    lbl1: TLabel;
    edtSenhaNova: TEdit;
    lbl11: TLabel;
    edtRepetirNovaSenha: TEdit;
    btnFechar: TBitBtn;
    btnAlterar: TBitBtn;
    edtSenhaAtual: TEdit;
    lbl12: TLabel;
    lblUsuarioLogado: TLabel;
    procedure FormShow(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
  private
    procedure LimparEdits;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmAlterarSenha: TfrmAlterarSenha;

implementation

uses
  cCadUsuario, uPrincipal, uDTMConexao;
{$R *.dfm}

procedure TfrmAlterarSenha.btnAlterarClick(Sender: TObject);
Var oUsuario:TUsuario;
begin
  if (edtSenhaAtual.Text=oUsuarioLogado.senha) then begin
    if (edtSenhaNova.Text=edtRepetirNovaSenha.Text) then begin
      try
        oUsuario:=TUsuario.Create(DtmPrincipal.ConexaoDB);
        oUsuario.codigo := oUsuarioLogado.codigo;
        oUsuario.senha  := edtSenhaNova.Text;
        oUsuario.AlterarSenha;
        oUsuarioLogado.senha := edtSenhaNova.Text;
        MessageDlg('Senha Alterada',MtInformation,[mbok],0);
        LimparEdits;
        Close;
      finally
        FreeAndNil(oUsuario);
      end;
    end
    else begin
      MessageDlg('Senhas digitadas n�o coincidem,',mtinformation,[mbok],0);
      edtSenhaNova.SetFocus;
    end;

  end

  else begin
    MessageDlg('Senha Atual est� inv�lida',mtinformation,[mbok],0);

  end;

end;

procedure TfrmAlterarSenha.btnFecharClick(Sender: TObject);
begin
  Close;
end;


procedure TfrmAlterarSenha.FormShow(Sender: TObject);
begin
  LimparEdits;
end;

procedure TfrmAlterarSenha.LimparEdits;
begin
  edtSenhaAtual.Clear;
  edtSenhaNova.Clear;
  edtRepetirNovaSenha.Clear;
  lblUsuarioLogado.Caption:=oUsuarioLogado.nome;
end;



end.
