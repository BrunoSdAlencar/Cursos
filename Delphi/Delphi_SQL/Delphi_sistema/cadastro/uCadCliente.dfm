inherited frmCadCliente: TfrmCadCliente
  Caption = 'Cadastro de Cliente'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pgcPrincipal: TPageControl
    inherited tabListagem: TTabSheet
      inherited grdListagem: TDBGrid
        Columns = <
          item
            Expanded = False
            FieldName = 'clienteId'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'nome'
            Width = 350
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'cep'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'endereco'
            Visible = True
          end>
      end
    end
    inherited tabManutencao: TTabSheet
      object Label1: TLabel
        Left = 552
        Top = 74
        Width = 19
        Height = 13
        Caption = 'CEP'
      end
      object lblEndereco: TLabel
        Left = 16
        Top = 136
        Width = 45
        Height = 13
        Caption = 'Endere'#231'o'
      end
      object lblBairro: TLabel
        Left = 552
        Top = 136
        Width = 28
        Height = 13
        Caption = 'Bairro'
      end
      object lblCidade: TLabel
        Left = 16
        Top = 200
        Width = 33
        Height = 13
        Caption = 'Cidade'
      end
      object lblTelefone: TLabel
        Left = 552
        Top = 200
        Width = 42
        Height = 13
        Caption = 'Telefone'
      end
      object lblEmail: TLabel
        Left = 16
        Top = 264
        Width = 28
        Height = 13
        Caption = 'E-mail'
      end
      object lblData: TLabel
        Left = 16
        Top = 317
        Width = 81
        Height = 13
        Caption = 'Data Nascimento'
      end
      object lbl1: TLabel
        Left = 16
        Top = 75
        Width = 27
        Height = 13
        Caption = 'Nome'
      end
      object edtclienteId: TLabeledEdit
        Tag = 1
        Left = 16
        Top = 48
        Width = 121
        Height = 21
        EditLabel.Width = 33
        EditLabel.Height = 13
        EditLabel.Caption = 'C'#243'digo'
        MaxLength = 10
        NumbersOnly = True
        TabOrder = 0
      end
      object edtCEP: TMaskEdit
        Left = 552
        Top = 96
        Width = 281
        Height = 21
        EditMask = '99.999-999;1;_'
        MaxLength = 10
        TabOrder = 1
        Text = '  .   -   '
      end
      object edtEndereco: TEdit
        Left = 16
        Top = 155
        Width = 497
        Height = 21
        MaxLength = 60
        TabOrder = 2
      end
      object edtBairro: TEdit
        Left = 552
        Top = 155
        Width = 281
        Height = 21
        MaxLength = 40
        TabOrder = 3
      end
      object edtCidade: TEdit
        Left = 16
        Top = 219
        Width = 497
        Height = 21
        MaxLength = 50
        TabOrder = 4
      end
      object edtTelefone: TMaskEdit
        Left = 552
        Top = 219
        Width = 278
        Height = 21
        EditMask = '(99)99999-9999;1;_'
        MaxLength = 14
        TabOrder = 5
        Text = '(  )     -    '
      end
      object edtEmail: TEdit
        Left = 16
        Top = 283
        Width = 497
        Height = 21
        MaxLength = 100
        TabOrder = 6
      end
      object edtdataNascimento: TDateEdit
        Left = 16
        Top = 336
        Width = 121
        Height = 21
        ClickKey = 114
        DialogTitle = 'Selecione a data'
        NumGlyphs = 2
        TabOrder = 7
      end
      object edtNome: TEdit
        Tag = 2
        Left = 16
        Top = 94
        Width = 497
        Height = 21
        TabOrder = 8
      end
    end
  end
  inherited pnlRodape: TPanel
    inherited btnNavigator: TDBNavigator
      Hints.Strings = ()
    end
  end
  inherited QryListagem: TZQuery
    Active = True
    SQL.Strings = (
      'select clienteId,'
      #9'nome,'
      #9'endereco,'
      #9'cidade,'
      #9'bairro,'
      #9'estado,'
      #9'cep,'
      #9'telefone,'
      #9'email,'
      #9'dataNascimento'
      'from clientes')
    object QryListagemclienteId: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'clienteId'
      ReadOnly = True
    end
    object QryListagemnome: TWideStringField
      DisplayLabel = 'Nome'
      FieldName = 'nome'
      Size = 60
    end
    object QryListagemendereco: TWideStringField
      DisplayLabel = 'Endereco'
      FieldName = 'endereco'
      Size = 60
    end
    object QryListagemcidade: TWideStringField
      DisplayLabel = 'Cidade'
      FieldName = 'cidade'
      Size = 50
    end
    object QryListagembairro: TWideStringField
      DisplayLabel = 'Bairro'
      FieldName = 'bairro'
      Size = 40
    end
    object QryListagemestado: TWideStringField
      DisplayLabel = 'Estado'
      FieldName = 'estado'
      Size = 2
    end
    object QryListagemcep: TWideStringField
      DisplayLabel = 'CEP'
      FieldName = 'cep'
      Size = 10
    end
    object QryListagemtelefone: TWideStringField
      DisplayLabel = 'Telefone'
      FieldName = 'telefone'
      Size = 14
    end
    object QryListagememail: TWideStringField
      DisplayLabel = 'E-mail'
      FieldName = 'email'
      Size = 100
    end
    object QryListagemdataNascimento: TDateTimeField
      DisplayLabel = 'Data Nascimento'
      FieldName = 'dataNascimento'
    end
  end
end
