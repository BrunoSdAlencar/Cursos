unit U_Calculadora;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.Layouts, FMX.Edit;

type
  TForm1 = class(TForm)
    btn_1: TButton;
    btn_2: TButton;
    btn_3: TButton;
    btn_4: TButton;
    btn_5: TButton;
    btn_6: TButton;
    btn_7: TButton;
    btn_8: TButton;
    btn_9: TButton;
    btn_0: TButton;
    btn_ponto: TButton;
    btn_igual: TButton;
    btn_sub: TButton;
    btn_div: TButton;
    btn_mult: TButton;
    btn_som: TButton;
    caixa_botoes: TLayout;
    caixa_topo: TLayout;
    lb_operador: TLabel;
    lb_num1: TLabel;
    lb_num2: TLabel;
    btn_clear: TButton;
    btn_zerar: TButton;
    procedure btn_subClick(Sender: TObject);
    procedure btn_somClick(Sender: TObject);
    procedure btn_divClick(Sender: TObject);
    procedure btn_multClick(Sender: TObject);
    procedure btn_igualClick(Sender: TObject);
    procedure btn_1Click(Sender: TObject);
    procedure btn_2Click(Sender: TObject);
    procedure btn_3Click(Sender: TObject);
    procedure btn_4Click(Sender: TObject);
    procedure btn_5Click(Sender: TObject);
    procedure btn_6Click(Sender: TObject);
    procedure btn_7Click(Sender: TObject);
    procedure btn_8Click(Sender: TObject);
    procedure btn_9Click(Sender: TObject);
    procedure btn_0Click(Sender: TObject);
    procedure btn_clearClick(Sender: TObject);
    procedure btn_pontoClick(Sender: TObject);
    procedure btn_zerarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.fmx}

procedure TForm1.btn_0Click(Sender: TObject);
begin
  if lb_operador.Text = '.' then
  begin
    lb_num1.Text := lb_num1.Text + '0';
  end
  else
  begin
    lb_num2.Text := lb_num2.Text + '0';
  end;
end;

procedure TForm1.btn_1Click(Sender: TObject);
begin

  if lb_operador.Text = '.' then
  begin
    lb_num1.Text := lb_num1.Text + '1';
  end
  else
  begin
    lb_num2.Text := lb_num2.Text + '1';
  end;

end;

procedure TForm1.btn_2Click(Sender: TObject);
begin
  if lb_operador.Text = '.' then
  begin
    lb_num1.Text := lb_num1.Text + '2';
  end
  else
  begin
    lb_num2.Text := lb_num2.Text + '2';
  end;
end;

procedure TForm1.btn_3Click(Sender: TObject);
begin
  if lb_operador.Text = '.' then
  begin
    lb_num1.Text := lb_num1.Text + '3';
  end
  else
  begin
    lb_num2.Text := lb_num2.Text + '3';
  end;
end;

procedure TForm1.btn_4Click(Sender: TObject);
begin
  if lb_operador.Text = '.' then
  begin
    lb_num1.Text := lb_num1.Text + '4';
  end
  else
  begin
    lb_num2.Text := lb_num2.Text + '4';
  end;
end;

procedure TForm1.btn_5Click(Sender: TObject);
begin
  if lb_operador.Text = '.' then
  begin
    lb_num1.Text := lb_num1.Text + '5';
  end
  else
  begin
    lb_num2.Text := lb_num2.Text + '5';
  end;
end;

procedure TForm1.btn_6Click(Sender: TObject);
begin
  if lb_operador.Text = '.' then
  begin
    lb_num1.Text := lb_num1.Text + '6';
  end
  else
  begin
    lb_num2.Text := lb_num2.Text + '6';
  end;
end;

procedure TForm1.btn_7Click(Sender: TObject);
begin
  if lb_operador.Text = '.' then
  begin
    lb_num1.Text := lb_num1.Text + '7';
  end
  else
  begin
    lb_num2.Text := lb_num2.Text + '7';
  end;
end;

procedure TForm1.btn_8Click(Sender: TObject);
begin
  if lb_operador.Text = '.' then
  begin
    lb_num1.Text := lb_num1.Text + '8';
  end
  else
  begin
    lb_num2.Text := lb_num2.Text + '8';
  end;
end;

procedure TForm1.btn_9Click(Sender: TObject);
begin
  if lb_operador.Text = '.' then
  begin
    lb_num1.Text := lb_num1.Text + '9';
  end
  else
  begin
    lb_num2.Text := lb_num2.Text + '9';
  end;
end;

procedure TForm1.btn_divClick(Sender: TObject);
begin
  lb_operador.Text := '/';
  btn_som.Enabled := true;
  btn_sub.Enabled := true;
  btn_mult.Enabled := true;
  btn_div.Enabled := false;
end;

procedure TForm1.btn_igualClick(Sender: TObject);
var
  n1, n2: double;
var
  operador: Char;

begin
  n1 := strToFloat(lb_num1.Text);
  n2 := strToFloat(lb_num2.Text);

  // Efetuando operações com if
  { if (lb_operador.Text = '+') then
    begin
    ShowMessage(FloatToStr(n1 + n2));
    end;
    if (lb_operador.Text = '-') then
    begin
    ShowMessage(FloatToStr(n1 - n2));
    end;
    if (lb_operador.Text = '*') then
    begin
    ShowMessage(FloatToStr(n1 * n2));
    end;
    if (lb_operador.Text = '/') then
    begin
    ShowMessage(FloatToStr(n1 / n2));
    end; }

  // Ulitização do switch
  operador := lb_operador.Text[1];
  case operador of
    '+':
      begin
        ShowMessage(FloatToStr(n1 + n2));
      end;
    '-':
      begin
        ShowMessage(FloatToStr(n1 - n2));
      end;
    '*':
      begin
        ShowMessage(FloatToStr(n1 * n2));
      end;
    '/':
      begin
        ShowMessage(FloatToStr(n1 / n2));
      end;
  end;

  lb_operador.Text := '.';
  lb_num1.Text := '';
  lb_num2.Text := '';

  btn_som.Enabled := true;
  btn_sub.Enabled := true;
  btn_mult.Enabled := true;
  btn_div.Enabled := true;
end;

procedure TForm1.btn_multClick(Sender: TObject);
begin
  lb_operador.Text := '*';
  btn_som.Enabled := true;
  btn_sub.Enabled := true;
  btn_mult.Enabled := false;
  btn_div.Enabled := true;
end;

procedure TForm1.btn_pontoClick(Sender: TObject);
begin
if lb_operador.Text = '.' then
  begin
    lb_num1.Text := lb_num1.Text + ',';
  end
  else
  begin
    lb_num2.Text := lb_num2.Text + ',';
  end;
end;

procedure TForm1.btn_somClick(Sender: TObject);
begin
  lb_operador.Text := '+';
  btn_som.Enabled := false;
  btn_sub.Enabled := true;
  btn_mult.Enabled := true;
  btn_div.Enabled := true;
end;

procedure TForm1.btn_subClick(Sender: TObject);
begin
  lb_operador.Text := '-';
  btn_som.Enabled := true;
  btn_sub.Enabled := false;
  btn_mult.Enabled := true;
  btn_div.Enabled := true;
end;

procedure TForm1.btn_zerarClick(Sender: TObject);
begin
  lb_num1.text:= '';
  lb_num2.text:= '';
  lb_operador.Text := '.';
end;

procedure TForm1.btn_clearClick(Sender: TObject);
begin
  // limpar com IF
  { if lb_operador.Text = '.' then
    begin
    lb_num1.Text := '';
    end
    else
    begin
    lb_num2.text := '';
    end; }
  { // Limpar com case
    var x : Char;

    x := lb_operador.Text[1];
    case x of
    '.':
    begin
    lb_num1.Text := '';
    end
    else
    begin
    lb_num2.Text := '';
    end;

    end; }
  // Apagando texto
  if lb_operador.Text = '.' then
  begin
    lb_num1.Text := copy(lb_num1.Text, 0, length(lb_num1.Text) - 1);
  end;
  if (lb_operador.Text <> '.') AND (lb_num2.Text = '') then
  begin
  lb_operador.Text := '.';
  btn_som.Enabled := true;
  btn_sub.Enabled := true;
  btn_mult.Enabled := true;
  btn_div.Enabled := true;

  end
  else
  begin
    lb_num2.Text := copy(lb_num2.Text, 0, length(lb_num2.Text) - 1);
  end;

end;

end.
