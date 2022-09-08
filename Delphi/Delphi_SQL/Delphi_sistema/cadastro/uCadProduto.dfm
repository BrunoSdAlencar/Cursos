inherited frmCadProduto: TfrmCadProduto
  Caption = 'Cadastro de Produto'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pgcPrincipal: TPageControl
    ActivePage = tabManutencao
    inherited tabListagem: TTabSheet
      inherited grdListagem: TDBGrid
        Columns = <
          item
            Expanded = False
            FieldName = 'produtoId'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'nome'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'valor'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'quantidade'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DescricaoCategoria'
            Width = 283
            Visible = True
          end>
      end
    end
    inherited tabManutencao: TTabSheet
      object Label1: TLabel
        Left = 16
        Top = 16
        Width = 33
        Height = 13
        Caption = 'C'#243'digo'
      end
      object lbl: TLabel
        Left = 16
        Top = 64
        Width = 27
        Height = 13
        Caption = 'Nome'
      end
      object lblDescricao: TLabel
        Left = 16
        Top = 120
        Width = 46
        Height = 13
        Caption = 'Descri'#231#227'o'
      end
      object lblValor: TLabel
        Left = 16
        Top = 269
        Width = 24
        Height = 13
        Caption = 'Valor'
      end
      object lblQuantidade: TLabel
        Left = 168
        Top = 269
        Width = 56
        Height = 13
        Caption = 'Quantidade'
      end
      object lbl1: TLabel
        Left = 584
        Top = 64
        Width = 47
        Height = 13
        Caption = 'Categoria'
      end
      object edtProdutoId: TEdit
        Tag = 1
        Left = 16
        Top = 37
        Width = 121
        Height = 21
        Enabled = False
        TabOrder = 0
      end
      object edtNome: TEdit
        Tag = 2
        Left = 16
        Top = 83
        Width = 529
        Height = 21
        TabOrder = 1
        Text = 'edtNome'
      end
      object edtDescricao: TMemo
        Left = 16
        Top = 139
        Width = 825
        Height = 118
        Lines.Strings = (
          'edtDescricao')
        MaxLength = 255
        TabOrder = 3
      end
      object edtValor: TCurrencyEdit
        Left = 16
        Top = 288
        Width = 121
        Height = 21
        TabOrder = 4
      end
      object edtQuantidade: TCurrencyEdit
        Left = 168
        Top = 288
        Width = 121
        Height = 21
        DisplayFormat = ',0.00;-R$ ,0.00'
        TabOrder = 5
      end
      object lkpCategoria: TDBLookupComboBox
        Left = 584
        Top = 83
        Width = 257
        Height = 21
        KeyField = 'categoriaId'
        ListField = 'descricao'
        ListSource = dtsCategoria
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
      'SELECT  p.produtoId,'
      '        p.nome,'
      '        p.descricao,'
      '        p.valor,'
      '        p.quantidade,'
      '        p.categoriaId,'
      '        c.descricao As DescricaoCategoria'
      '   FROM produtos as p'
      '   LEFT JOIN categoria as c on c.categoriaId=p.categoriaId')
    object QryListagemprodutoId: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'produtoId'
      ReadOnly = True
    end
    object QryListagemnome: TWideStringField
      DisplayLabel = 'Nome'
      FieldName = 'nome'
      Size = 60
    end
    object QryListagemdescricao: TWideStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'descricao'
      Size = 255
    end
    object QryListagemvalor: TFloatField
      DisplayLabel = 'Valor'
      FieldName = 'valor'
    end
    object QryListagemquantidade: TFloatField
      DisplayLabel = 'Quantidade'
      FieldName = 'quantidade'
    end
    object QryListagemcategoriaId: TIntegerField
      DisplayLabel = 'Cod. Categoria'
      FieldName = 'categoriaId'
    end
    object QryListagemDescricaoCategoria: TWideStringField
      DisplayLabel = 'Descri'#231#227'o da categoria'
      FieldName = 'DescricaoCategoria'
      Size = 30
    end
  end
  object QryCategoria: TZQuery
    Connection = dtmPrincipal.ConexaoDB
    SQL.Strings = (
      'Select categoriaId, descricao from categoria')
    Params = <>
    Left = 756
    Top = 128
    object QryCategoriacategoriaId: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'categoriaId'
      ReadOnly = True
    end
    object QryCategoriadescricao: TWideStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'descricao'
      Size = 30
    end
  end
  object dtsCategoria: TDataSource
    DataSet = QryCategoria
    Left = 812
    Top = 128
  end
end
