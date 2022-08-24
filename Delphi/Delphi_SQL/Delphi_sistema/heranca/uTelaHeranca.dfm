object frmTelaHeranca: TfrmTelaHeranca
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'INFORME AQUI O T'#205'TULO'
  ClientHeight = 566
  ClientWidth = 1055
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object pgcPrincipal: TPageControl
    Left = 0
    Top = 0
    Width = 1055
    Height = 525
    ActivePage = tabListagem
    Align = alClient
    TabOrder = 0
    object tabListagem: TTabSheet
      Caption = 'Listagem'
      object pnlListagemTopo: TPanel
        Left = 0
        Top = 0
        Width = 1047
        Height = 65
        Align = alTop
        TabOrder = 0
        object mskPesquisar: TMaskEdit
          Left = 16
          Top = 24
          Width = 385
          Height = 21
          TabOrder = 0
          Text = ''
          TextHint = 'Digite sua pesquisa'
        end
        object btnPesquisar: TBitBtn
          Left = 407
          Top = 22
          Width = 75
          Height = 25
          Caption = '&PESQUISAR'
          TabOrder = 1
        end
      end
      object grdListagem: TDBGrid
        Left = 0
        Top = 65
        Width = 1047
        Height = 432
        Align = alClient
        DataSource = dtsListagem
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
      end
    end
    object tabManutencao: TTabSheet
      Caption = 'Manuten'#231#227'o'
      ImageIndex = 1
    end
  end
  object pnlRodape: TPanel
    Left = 0
    Top = 525
    Width = 1055
    Height = 41
    Align = alBottom
    TabOrder = 1
    object btnNovo: TBitBtn
      Left = 20
      Top = 6
      Width = 75
      Height = 25
      Caption = '&NOVO'
      TabOrder = 0
      OnClick = btnNovoClick
    end
    object btnAlterar: TBitBtn
      Left = 101
      Top = 6
      Width = 75
      Height = 25
      Caption = '&ALTERAR'
      TabOrder = 1
      OnClick = btnAlterarClick
    end
    object btnCancelar: TBitBtn
      Left = 182
      Top = 6
      Width = 75
      Height = 25
      Caption = '&CANCELAR'
      TabOrder = 2
      OnClick = btnCancelarClick
    end
    object btnGravar: TBitBtn
      Left = 263
      Top = 6
      Width = 75
      Height = 25
      Caption = '&GRAVAR'
      TabOrder = 3
      OnClick = btnGravarClick
    end
    object btnApagar: TBitBtn
      Left = 344
      Top = 6
      Width = 75
      Height = 25
      Caption = 'APAGA&R'
      TabOrder = 4
      OnClick = btnApagarClick
    end
    object btnFechar: TBitBtn
      Left = 964
      Top = 6
      Width = 75
      Height = 25
      Caption = '&FECHAR'
      TabOrder = 5
      OnClick = btnFecharClick
    end
    object btnNavigator: TDBNavigator
      Left = 440
      Top = 6
      Width = 224
      Height = 25
      DataSource = dtsListagem
      VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
      TabOrder = 6
    end
  end
  object QryListagem: TZQuery
    Connection = dtmPrincipal.ConexaoDB
    Params = <>
    Left = 596
    Top = 32
  end
  object dtsListagem: TDataSource
    DataSet = QryListagem
    Left = 668
    Top = 32
  end
end
