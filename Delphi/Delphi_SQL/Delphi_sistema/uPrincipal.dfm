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
  PixelsPerInch = 96
  TextHeight = 13
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
      end
      object N1: TMenuItem
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
      end
    end
    object RELATRIO1: TMenuItem
      Caption = 'RELAT'#211'RIO'
      object CLIENTE3: TMenuItem
        Caption = 'CLIENTE'
      end
      object CLIENTE4: TMenuItem
        Caption = '-'
      end
      object PRODUTO1: TMenuItem
        Caption = 'PRODUTO'
      end
      object PRODUTO2: TMenuItem
        Caption = '-'
      end
      object VENDA1: TMenuItem
        Caption = 'VENDA POR DATA'
      end
    end
  end
end