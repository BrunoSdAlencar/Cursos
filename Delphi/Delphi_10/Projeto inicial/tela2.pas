unit tela2;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  Tfrm_tela2 = class(TForm)
    Label1: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_tela2: Tfrm_tela2;

implementation

{$R *.dfm}

procedure Tfrm_tela2.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  frm_tela2 := nil;
end;

end.
