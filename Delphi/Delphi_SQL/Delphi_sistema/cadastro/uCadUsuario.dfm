inherited frmCadUsuario: TfrmCadUsuario
  Caption = 'Cadastro de Usu'#225'rio'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pgcPrincipal: TPageControl
    inherited tabListagem: TTabSheet
      inherited grdListagem: TDBGrid
        Columns = <
          item
            Expanded = False
            FieldName = 'usuarioId'
            Width = 152
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'nome'
            Width = 667
            Visible = True
          end>
      end
    end
    inherited tabManutencao: TTabSheet
      object lbl1: TLabel
        Left = 16
        Top = 19
        Width = 33
        Height = 13
        Caption = 'C'#243'digo'
      end
      object lbl11: TLabel
        Left = 16
        Top = 75
        Width = 27
        Height = 13
        Caption = 'Nome'
      end
      object lbl12: TLabel
        Left = 16
        Top = 131
        Width = 30
        Height = 13
        Caption = 'Senha'
      end
      object edtClienteId: TEdit
        Tag = 1
        Left = 16
        Top = 38
        Width = 137
        Height = 21
        ReadOnly = True
        TabOrder = 0
      end
      object edtNome: TEdit
        Tag = 2
        Left = 16
        Top = 94
        Width = 657
        Height = 21
        MaxLength = 50
        TabOrder = 1
      end
      object edtSenha: TEdit
        Tag = 2
        Left = 16
        Top = 150
        Width = 497
        Height = 21
        MaxLength = 40
        PasswordChar = '#'
        TabOrder = 2
      end
    end
  end
  inherited pnlRodape: TPanel
    inherited btnNavigator: TDBNavigator
      Hints.Strings = ()
    end
  end
  inherited QryListagem: TZQuery
    SQL.Strings = (
      'Select  usuarioId,'
      '        nome,'
      '        senha'
      'From usuarios')
    object QryListagemusuarioId: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'usuarioId'
      ReadOnly = True
    end
    object QryListagemnome: TWideStringField
      DisplayLabel = 'Nome'
      FieldName = 'nome'
      Required = True
      Size = 50
    end
    object QryListagemsenha: TWideStringField
      FieldName = 'senha'
      Required = True
      Size = 40
    end
  end
end
