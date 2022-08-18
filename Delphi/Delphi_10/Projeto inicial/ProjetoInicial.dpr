program ProjetoInicial;

uses
  Vcl.Forms,
  Inicial in 'Inicial.pas' {TCad_Usu},
  tela2 in 'tela2.pas' {frm_tela2};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TTCad_Usu, TCad_Usu);
  Application.Run;
end.
