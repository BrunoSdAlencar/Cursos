object dtmPrincipal: TdtmPrincipal
  OldCreateOrder = False
  Height = 369
  Width = 483
  object ConexaoDB: TZConnection
    ControlsCodePage = cCP_UTF16
    AutoEncodeStrings = True
    Catalog = ''
    Properties.Strings = (
      'controls_cp=CP_UTF16'
      'AutoEncodeStrings=True')
    TransactIsolationLevel = tiReadCommitted
    SQLHourGlass = True
    HostName = '.\SERVERCURSO'
    Port = 0
    Database = ''
    User = 'sa'
    Password = 'rt6666'
    Protocol = 'mssql'
    LibraryLocation = 'D:\Cursos\Delphi\Delphi_sistema\ntwdblib.dll'
    Left = 16
    Top = 16
  end
end
