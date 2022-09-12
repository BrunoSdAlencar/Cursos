object frmPrincipal: TfrmPrincipal
  Left = 0
  Top = 0
  Caption = 'Menu Principal'
  ClientHeight = 299
  ClientWidth = 635
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = mainPrincipal
  OldCreateOrder = False
  WindowState = wsMaximized
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object stpPrincipal: TStatusBar
    Left = 0
    Top = 280
    Width = 635
    Height = 19
    Panels = <
      item
        Width = 150
      end>
  end
  object mainPrincipal: TMainMenu
    Left = 592
    Top = 16
    object CADASTRO1: TMenuItem
      Caption = 'CADASTRO'
      object CLIENTE1: TMenuItem
        Caption = 'CLIENTE'
        OnClick = CLIENTE1Click
      end
      object CLIENTE2: TMenuItem
        Caption = '-'
      end
      object CATEGORIA1: TMenuItem
        Caption = 'CATEGORIA'
        OnClick = CATEGORIA1Click
      end
      object CATEGORIA2: TMenuItem
        Caption = 'PRODUTO'
        OnClick = CATEGORIA2Click
      end
      object N1: TMenuItem
        Caption = '-'
      end
      object USURIO1: TMenuItem
        Caption = 'USU'#193'RIO'
        OnClick = USURIO1Click
      end
      object ALTERARSENHA1: TMenuItem
        Caption = 'ALTERAR SENHA'
        OnClick = ALTERARSENHA1Click
      end
      object N2: TMenuItem
        Caption = '-'
      end
      object mnuFechar: TMenuItem
        Caption = 'FECHAR'
        OnClick = mnuFecharClick
      end
    end
    object MOVIMENTAO1: TMenuItem
      Caption = 'MOVIMENTA'#199#195'O'
      object VENDAS1: TMenuItem
        Caption = 'VENDAS'
        OnClick = VENDAS1Click
      end
    end
    object RELATRIO1: TMenuItem
      Caption = 'RELAT'#211'RIO'
      object CATEGORIA3: TMenuItem
        Caption = 'CATEGORIA'
        OnClick = CATEGORIA3Click
      end
      object CLIENTE3: TMenuItem
        Caption = 'CLIENTE'
        OnClick = CLIENTE3Click
      end
      object FICHADECLIENTE1: TMenuItem
        Caption = 'FICHA DE CLIENTE'
        OnClick = FICHADECLIENTE1Click
      end
      object CLIENTE4: TMenuItem
        Caption = '-'
      end
      object PRODUTO1: TMenuItem
        Caption = 'PRODUTO'
        OnClick = PRODUTO1Click
      end
      object PRODUTO2: TMenuItem
        Caption = '-'
      end
      object VENDA1: TMenuItem
        Caption = 'VENDA POR DATA'
        OnClick = VENDA1Click
      end
    end
  end
end
