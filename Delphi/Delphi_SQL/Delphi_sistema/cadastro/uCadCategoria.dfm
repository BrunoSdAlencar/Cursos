inherited frmCadCategoria: TfrmCadCategoria
  Caption = 'Cadastro de Categorias'
  ClientHeight = 421
  ClientWidth = 848
  ExplicitWidth = 854
  ExplicitHeight = 450
  PixelsPerInch = 96
  TextHeight = 13
  inherited pgcPrincipal: TPageControl
    Width = 848
    Height = 388
    ExplicitWidth = 848
    ExplicitHeight = 388
    inherited tabListagem: TTabSheet
      ExplicitWidth = 840
      ExplicitHeight = 360
      inherited pnlListagemTopo: TPanel
        Width = 840
        ExplicitWidth = 840
      end
      inherited grdListagem: TDBGrid
        Width = 840
        Height = 295
        Columns = <
          item
            Expanded = False
            FieldName = 'categoriaId'
            Width = 93
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Descricao'
            Width = 396
            Visible = True
          end>
      end
    end
    inherited tabManutencao: TTabSheet
      ExplicitWidth = 840
      ExplicitHeight = 360
      object edtCategoriaId: TLabeledEdit
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
      object edtDescricao: TLabeledEdit
        Tag = 2
        Left = 16
        Top = 96
        Width = 497
        Height = 21
        EditLabel.Width = 46
        EditLabel.Height = 13
        EditLabel.Caption = 'Descri'#231#227'o'
        MaxLength = 30
        TabOrder = 1
      end
    end
  end
  inherited pnlRodape: TPanel
    Top = 388
    Width = 848
    ExplicitTop = 388
    ExplicitWidth = 848
    inherited btnFechar: TBitBtn
      Left = 740
      ExplicitLeft = 740
    end
    inherited btnNavigator: TDBNavigator
      Hints.Strings = ()
    end
  end
  inherited QryListagem: TZQuery
    SQL.Strings = (
      'SELECT categoriaId, '
      #9#9'Descricao '
      #9'FROM categoria')
    Left = 732
    object QryListagemcategoriaId: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'categoriaId'
      ReadOnly = True
    end
    object QryListagemDescricao: TWideStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'Descricao'
      Size = 30
    end
  end
  inherited dtsListagem: TDataSource
    Left = 796
  end
end
