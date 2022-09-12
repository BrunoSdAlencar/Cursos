unit uSelecionarData;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Mask, RxToolEdit,
  Vcl.Buttons, System.DateUtils;

type
  TfrmSelecionarData = class(TForm)
    edtDataInicial: TDateEdit;
    lblData1: TLabel;
    edtDataFinal: TDateEdit;
    Label1: TLabel;
    btnOk: TBitBtn;
    procedure btnOkClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSelecionarData: TfrmSelecionarData;

implementation

{$R *.dfm}

procedure TfrmSelecionarData.btnOkClick(Sender: TObject);
begin
  if (EdtDataFinal.Date) < (edtDataInicial.Date) then begin
    MessageDlg('Data Final n�o pode ser maior que a data inicio',mtInformation,[mbok],0);
    EdtDataFinal.SetFocus;
    abort;
  end;

  if (EdtDataFinal.Date=0) OR (edtDataInicial.Date=0) then begin
    MessageDlg('Data Inicial ou Final s�o campo obrigat�rio',MtInformation,[mbok],0);
    edtDataInicial.SetFocus;
    abort;
  end;


  Close;
end;


procedure TfrmSelecionarData.FormShow(Sender: TObject);
begin
  edtDataInicial.Date := StartOfTheMonth(Date);
  EdtDataFinal.Date  := EndOfTheMonth(Date);
end;

end.
