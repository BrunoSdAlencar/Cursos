unit Inicial;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons;

type
  TTCad_Usu = class(TForm)
    lb_cad_usuario: TLabel;
    btn_salvar_venda: TButton;
    SpeedButton1: TSpeedButton;
    btn_deletar: TButton;
    btn_edit: TButton;
    txt_nome: TEdit;
    lb_nome: TLabel;
    txt_nome2: TEdit;
    txt_nome3: TEdit;
    lb_valor: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    btn_calcular: TButton;
    txt_vlr1: TEdit;
    txt_vlr2: TEdit;
    txt_vlr3: TEdit;
    Label3: TLabel;
    procedure btn_salvar_vendaClick(Sender: TObject);
    procedure btn_deletarClick(Sender: TObject);
    procedure btn_editClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure btn_calcularClick(Sender: TObject);
  private
    var nome : string;
    { Private declarations }
  public
    var sobrenome, idade : string;
    var valor : integer;
    { Public declarations }
  end;

var
  TCad_Usu: TTCad_Usu;

implementation

{$R *.dfm}

procedure TTCad_Usu.btn_calcularClick(Sender: TObject);
begin
  var vlr1, vlr2, total : double;
  vlr1 := StrToFloat(txt_vlr1.Text);
  vlr2 := StrToFloat(txt_vlr2.Text);
  total := vlr1 + vlr2;
  txt_vlr3.Text := FloatToStr(total);
end;

procedure TTCad_Usu.btn_deletarClick(Sender: TObject);
begin
  nome:= 'Arthur';
  txt_nome.Text := nome;
  txt_nome2.Text := '';
  txt_nome3.Text := '';
end;

procedure TTCad_Usu.btn_editClick(Sender: TObject);
begin
  nome:= 'Leticia';
  sobrenome := 'Alencar';
  idade := '90';
  lb_valor.Caption := nome + ' ' + sobrenome + ' ' + idade;
end;

procedure TTCad_Usu.btn_salvar_vendaClick(Sender: TObject);
begin
  nome := 'Bruno';
  sobrenome := 'Silva';
  idade := '30';
  txt_nome.Text := nome;
  txt_nome2.Text := sobrenome;
  txt_nome3.Text := idade;
end;

procedure TTCad_Usu.SpeedButton1Click(Sender: TObject);
begin
  valor := 5;
  lb_valor.Caption := IntToStr(valor);
end;

end.
