program ProjetoInicial;

uses
  Vcl.Forms,
  Inicial in 'Inicial.pas' {TCad_Usu};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TTCad_Usu, TCad_Usu);
  Application.Run;
end.
