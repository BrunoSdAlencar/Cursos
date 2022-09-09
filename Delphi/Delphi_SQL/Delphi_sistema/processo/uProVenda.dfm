inherited frmProVenda: TfrmProVenda
  Caption = 'Vendas'
  ClientWidth = 784
  ExplicitWidth = 790
  PixelsPerInch = 96
  TextHeight = 13
  inherited pgcPrincipal: TPageControl
    Width = 784
    ActivePage = tabManutencao
    ExplicitWidth = 784
    inherited tabListagem: TTabSheet
      ExplicitWidth = 776
      inherited pnlListagemTopo: TPanel
        Width = 776
        ExplicitWidth = 776
      end
      inherited grdListagem: TDBGrid
        Width = 776
        Columns = <
          item
            Expanded = False
            FieldName = 'vendaId'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'clienteId'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'nome'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'dataVenda'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'totalVenda'
            Visible = True
          end>
      end
    end
    inherited tabManutencao: TTabSheet
      ExplicitWidth = 776
      object Label1: TLabel
        Left = 3
        Top = 15
        Width = 70
        Height = 13
        Caption = 'N'#250'mero Venda'
        FocusControl = edtVendaId
      end
      object lbl1: TLabel
        Left = 160
        Top = 15
        Width = 33
        Height = 13
        Caption = 'Cliente'
      end
      object lblData: TLabel
        Left = 568
        Top = 15
        Width = 56
        Height = 13
        Caption = 'Data Venda'
      end
      object edtVendaId: TDBEdit
        Tag = 1
        Left = 3
        Top = 34
        Width = 134
        Height = 21
        DataField = 'vendaId'
        DataSource = dtsListagem
        TabOrder = 0
      end
      object lkpCliente: TDBLookupComboBox
        Left = 160
        Top = 34
        Width = 393
        Height = 21
        KeyField = 'clienteId'
        ListField = 'nome'
        ListSource = dtmVendas.dtsCliente
        TabOrder = 1
      end
      object edtDataVenda: TDateEdit
        Left = 568
        Top = 34
        Width = 121
        Height = 21
        ClickKey = 114
        DialogTitle = 'Selecione a data'
        NumGlyphs = 2
        TabOrder = 2
      end
      object pnl1: TPanel
        Left = 0
        Top = 56
        Width = 776
        Height = 60
        Align = alCustom
        TabOrder = 3
        object lbl11: TLabel
          Left = 6
          Top = 11
          Width = 38
          Height = 13
          Caption = 'Produto'
        end
        object lblData1: TLabel
          Left = 304
          Top = 11
          Width = 64
          Height = 13
          Caption = 'Valor Unitario'
        end
        object lblData11: TLabel
          Left = 399
          Top = 11
          Width = 56
          Height = 13
          Caption = 'Quantidade'
        end
        object lblData12: TLabel
          Left = 494
          Top = 11
          Width = 80
          Height = 13
          Caption = 'Total do Produto'
        end
        object lkpProduto: TDBLookupComboBox
          Left = 3
          Top = 35
          Width = 295
          Height = 21
          KeyField = 'produtoId'
          ListField = 'nome'
          ListSource = dtmVendas.dtsProdutos
          TabOrder = 0
          OnExit = lkpProdutoExit
        end
        object edtValorUnitario: TCurrencyEdit
          Left = 304
          Top = 35
          Width = 89
          Height = 21
          DisplayFormat = ',0.00;-R$ ,0.00'
          TabOrder = 1
        end
        object edtQuantidade: TCurrencyEdit
          Left = 399
          Top = 35
          Width = 89
          Height = 21
          DisplayFormat = ',0.00;-R$ ,0.00'
          TabOrder = 2
          OnExit = edtQuantidadeExit
        end
        object edtTotalProduto: TCurrencyEdit
          Left = 494
          Top = 35
          Width = 89
          Height = 21
          TabStop = False
          DisplayFormat = ',0.00;-R$ ,0.00'
          ParentColor = True
          ReadOnly = True
          TabOrder = 3
        end
        object btnAdicionarItem: TBitBtn
          Left = 611
          Top = 31
          Width = 75
          Height = 25
          Caption = 'ADICIONAR'
          TabOrder = 4
          OnClick = btnAdicionarItemClick
        end
        object btnApagarItem: TBitBtn
          Left = 692
          Top = 31
          Width = 75
          Height = 25
          Caption = 'RE&MOVER'
          TabOrder = 5
          OnClick = btnApagarItemClick
        end
      end
      object pnl2: TPanel
        Left = 6
        Top = 118
        Width = 770
        Height = 297
        Align = alCustom
        TabOrder = 4
        object dbGridItensVenda: TDBGrid
          Left = 1
          Top = 1
          Width = 768
          Height = 295
          Align = alClient
          DataSource = dtmVendas.dtsItensVenda
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgCancelOnExit]
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'Tahoma'
          TitleFont.Style = []
          OnDblClick = dbGridItensVendaDblClick
          OnKeyDown = dbGridItensVendaKeyDown
          Columns = <
            item
              Expanded = False
              FieldName = 'produtoId'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NomeProduto'
              Width = 438
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Quantidade'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'valorUnitario'
              Width = 81
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'valorTotalProduto'
              Width = 90
              Visible = True
            end>
        end
      end
      object pnl3: TPanel
        Left = 0
        Top = 417
        Width = 776
        Height = 41
        Align = alBottom
        TabOrder = 5
        object lblValor: TLabel
          Left = 556
          Top = 4
          Width = 84
          Height = 13
          Caption = 'Valor da Venda'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label2: TLabel
          Left = 646
          Top = 12
          Width = 24
          Height = 13
          Caption = 'Valor'
        end
        object edtValorTotal: TCurrencyEdit
          Left = 646
          Top = 4
          Width = 121
          Height = 21
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentColor = True
          ParentFont = False
          ReadOnly = True
          TabOrder = 0
        end
      end
    end
  end
  inherited pnlRodape: TPanel
    Width = 784
    ExplicitWidth = 784
    inherited btnNavigator: TDBNavigator
      Hints.Strings = ()
    end
  end
  inherited QryListagem: TZQuery
    SQL.Strings = (
      'SELECT vendas.vendaId'
      #9#9',vendas.clienteId'
      #9#9',clientes.nome'
      #9#9',vendas.dataVenda'
      #9#9',vendas.totalVenda'
      #9'From vendas'
      #9'Inner join clientes on clientes.clienteId=vendas.clienteId')
    Left = 492
    Top = 0
    object QryListagemvendaId: TIntegerField
      DisplayLabel = 'N'#250'mero Venda'
      FieldName = 'vendaId'
      ReadOnly = True
    end
    object QryListagemclienteId: TIntegerField
      DisplayLabel = 'C'#243'd. Cliente'
      FieldName = 'clienteId'
      Required = True
    end
    object QryListagemnome: TWideStringField
      DisplayLabel = 'Nome do Cliente'
      FieldName = 'nome'
      Size = 60
    end
    object QryListagemdataVenda: TDateTimeField
      DisplayLabel = 'Data Venda'
      FieldName = 'dataVenda'
    end
    object QryListagemtotalVenda: TFloatField
      DisplayLabel = 'Total da Venda'
      FieldName = 'totalVenda'
    end
  end
  inherited dtsListagem: TDataSource
    Left = 564
    Top = 65528
  end
end
