object frmRelCadProduto: TfrmRelCadProduto
  Left = 0
  Top = 0
  Caption = 'Relat'#243'rio de Produtos'
  ClientHeight = 530
  ClientWidth = 869
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Relatorio: TRLReport
    Left = 0
    Top = 0
    Width = 794
    Height = 1123
    DataSource = dtsProdutos
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    object Cabecario: TRLBand
      Left = 38
      Top = 38
      Width = 718
      Height = 91
      BandType = btHeader
      object rlbl1: TRLLabel
        Left = 0
        Top = 13
        Width = 229
        Height = 24
        Caption = 'Listagem de Produtos'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -21
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object rldrw1: TRLDraw
        Left = 0
        Top = 43
        Width = 718
        Height = 48
        Align = faBottom
        DrawKind = dkLine
        Pen.Width = 2
      end
    end
    object RLBand1: TRLBand
      Left = 38
      Top = 219
      Width = 718
      Height = 80
      BandType = btFooter
      object rldrw11: TRLDraw
        Left = 0
        Top = 0
        Width = 718
        Height = 48
        Align = faTop
        DrawKind = dkLine
        Pen.Width = 2
      end
      object rlsystmnf1: TRLSystemInfo
        Left = 24
        Top = 56
        Width = 60
        Height = 16
        Info = itFullDate
        Text = ''
      end
      object rlsystmnf11: TRLSystemInfo
        Left = 627
        Top = 54
        Width = 25
        Height = 16
        Alignment = taRightJustify
        Info = itPageNumber
        Text = ''
      end
      object rlsystmnf111: TRLSystemInfo
        Left = 680
        Top = 54
        Width = 17
        Height = 16
        Alignment = taRightJustify
        Info = itLastPageNumber
        Text = ''
      end
      object rlbl2: TRLLabel
        Left = 658
        Top = 54
        Width = 24
        Height = 16
        Caption = '/'
      end
      object rlbl3: TRLLabel
        Left = 544
        Top = 56
        Width = 53
        Height = 16
        Caption = 'Pagina:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
    end
    object RLBand2: TRLBand
      Left = 38
      Top = 185
      Width = 718
      Height = 34
      object rldbtxtcategoriaId: TRLDBText
        Left = 3
        Top = 16
        Width = 57
        Height = 16
        DataField = 'produtoId'
        DataSource = dtsProdutos
        Text = ''
      end
      object rldbtxtcategoriaId1: TRLDBText
        Left = 76
        Top = 16
        Width = 36
        Height = 16
        DataField = 'nome'
        DataSource = dtsProdutos
        Text = ''
      end
      object rldbtxtnome: TRLDBText
        Left = 292
        Top = 18
        Width = 67
        Height = 16
        DataField = 'quantidade'
        DataSource = dtsProdutos
        Text = ''
      end
      object rldbtxtnome1: TRLDBText
        Left = 508
        Top = 16
        Width = 30
        Height = 16
        DataField = 'valor'
        DataSource = dtsProdutos
        Text = ''
      end
    end
    object RLBand3: TRLBand
      Left = 38
      Top = 129
      Width = 718
      Height = 56
      BandType = btColumnHeader
      object rlpnl1: TRLPanel
        Left = 0
        Top = 0
        Width = 718
        Height = 56
        Align = faClient
        Color = clInfoBk
        ParentColor = False
        Transparent = False
        object rlbl411: TRLLabel
          Left = 76
          Top = 6
          Width = 105
          Height = 16
          Caption = 'Nome do Produto'
        end
        object rlbl41: TRLLabel
          Left = 3
          Top = 6
          Width = 44
          Height = 16
          Caption = 'C'#243'digo'
          Color = clInfoBk
          ParentColor = False
          Transparent = False
        end
        object rlbl4111: TRLLabel
          Left = 292
          Top = 6
          Width = 144
          Height = 16
          Caption = 'Quantidade em Estoque'
        end
        object rlbl4112: TRLLabel
          Left = 508
          Top = 6
          Width = 38
          Height = 16
          Caption = 'Pre'#231'o'
        end
      end
    end
  end
  object QryProdutos: TZQuery
    Connection = dtmPrincipal.ConexaoDB
    Active = True
    SQL.Strings = (
      'SELECT * FROM produtos'
      'Order by Nome')
    Params = <>
    Left = 808
    Top = 56
    object QryProdutosprodutoId: TIntegerField
      FieldName = 'produtoId'
      ReadOnly = True
    end
    object QryProdutosnome: TWideStringField
      FieldName = 'nome'
      Size = 60
    end
    object QryProdutosvalor: TFloatField
      FieldName = 'valor'
    end
    object QryProdutosquantidade: TFloatField
      FieldName = 'quantidade'
    end
  end
  object dtsProdutos: TDataSource
    DataSet = QryProdutos
    Left = 808
    Top = 136
  end
  object rlpdfltr1: TRLPDFFilter
    DocumentInfo.Creator = 
      'FortesReport Community Edition v4.0.0.1 \251 Copyright '#169' 1999-20' +
      '21 Fortes Inform'#225'tica'
    DisplayName = 'Documento PDF'
    Left = 808
    Top = 208
  end
end
