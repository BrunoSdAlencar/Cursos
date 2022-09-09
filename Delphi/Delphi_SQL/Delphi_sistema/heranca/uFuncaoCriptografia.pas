unit uFuncaoCriptografia;

interface
uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs;
{$REGION 'Declara��o das func�es'}
function Criptografar(const aEntrada:string): string;
function Descriptografar(const aEntrada:string): string;
 {$ENDREGION}

implementation

{$REGION 'Criptografar'}

function Criptografar(const aEntrada:string): string;
Var i, iQtdeEnt, iIntervalo:Integer;
    sSaida:String;
    sProximoCaracter :String;
begin
  iIntervalo:= 6;
  i         := 0;
  iQtdeEnt  := 0;

  if (aEntrada <> EmptyStr) then
  begin
    iQtdeEnt    := Length(aEntrada);
    for i  := iQtdeEnt downto 1 do //Faz o Loop Contr�rio
    begin
      sProximoCaracter  := Copy(aEntrada, i, 1);
      sSaida := sSaida + (char(ord(sProximoCaracter[1])+iIntervalo));
    end;
  end;

  Result:= sSaida;
end;

{$ENDREGION}

{$REGION 'Descriptografar'}
function Descriptografar(const aEntrada:string): string;
Var i, iQtdeEnt, iIntervalo:Integer;
    sSaida:String;
    sProximoCaracter :String;
begin
  iIntervalo := 6;
  i          := 0;
  iQtdeEnt   := 0;
  if (aEntrada <> EmptyStr) then begin
    iQtdeEnt := Length(aEntrada);

    for i := iQtdeEnt downto 1 do
    begin
      sProximoCaracter  := Copy(aEntrada, i, 1);
      sSaida := sSaida + (char(ord(sProximoCaracter[1])-iIntervalo));
    end;
  end;

  Result:= sSaida;
end;
{$ENDREGION}

end.