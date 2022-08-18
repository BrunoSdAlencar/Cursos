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
    btn_tela2: TButton;
    procedure btn_salvar_vendaClick(Sender: TObject);
    procedure btn_deletarClick(Sender: TObject);
    procedure btn_editClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure btn_calcularClick(Sender: TObject);
    procedure btn_tela2Click(Sender: TObject);
  private
    var nome : string;
    { Private declarations }
  public
    var sobrenome, idade : string;
    var valor, cont : integer;
    { Public declarations }
  end;

var
  TCad_Usu: TTCad_Usu;

implementation

{$R *.dfm}

uses tela2;

procedure TTCad_Usu.btn_calcularClick(Sender: TObject);
  var vlr1, vlr2, total, media : double;
  var cont : integer;
begin

  vlr1 := StrToFloat(txt_vlr1.Text);
  vlr2 := StrToFloat(txt_vlr2.Text);

  total := vlr1 + vlr2;
  txt_vlr3.Text := FloatToStr(total);

  // Operador de condição if
  {media:=60;
  if (total>=media) OR (total > 50) then
  begin
    ShowMessage('Aprovado a média foi ' + FloatToStr(media));
  end
  Else
  begin
    ShowMessage('Reprovado a média foi ' + FloatToStr(media));
  end; }

  // Laço de repetição FOR
  {for cont := 5 Downto 0 do
    begin
      ShowMessage(IntToStr(cont));
      if (cont<= 0) then
      begin
       showmessage('O contador chegou a zero');
      end;
    end;}

  // Loope de repetição WHILE
  cont := 1;
  while (cont<=5) do
  begin
    ShowMessage(IntToStr(cont));
    cont:= cont + 1;
    if (cont = 6) then
      begin
        ShowMessage('Fim');
      end
      else
      begin
        ShowMessage('continua');
      end;
  end;


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

procedure TTCad_Usu.btn_tela2Click(Sender: TObject);
begin
  frm_tela2 := Tfrm_tela2.Create(self);
  frm_tela2.ShowModal;
end;

procedure TTCad_Usu.SpeedButton1Click(Sender: TObject);
begin
  valor := 5;
  lb_valor.Caption := IntToStr(valor);
end;

end.
