unit uProVenda;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uTelaHeranca, Data.DB,
  ZAbstractRODataset, ZAbstractDataset, ZDataset, Vcl.DBCtrls, Vcl.Grids,
  Vcl.DBGrids, Vcl.StdCtrls, Vcl.Buttons, Vcl.Mask, Vcl.ExtCtrls, Vcl.ComCtrls,
   uDTMConexao, RxToolEdit, RxCurrEdit, uEnum,cProVenda, uDTMVenda;

type
  TfrmProVenda = class(TfrmTelaHeranca)
    QryListagemvendaId: TIntegerField;
    QryListagemclienteId: TIntegerField;
    QryListagemnome: TWideStringField;
    QryListagemdataVenda: TDateTimeField;
    QryListagemtotalVenda: TFloatField;
    Label1: TLabel;
    edtVendaId: TDBEdit;
    lbl1: TLabel;
    lkpCliente: TDBLookupComboBox;
    edtDataVenda: TDateEdit;
    lblData: TLabel;
    pnl1: TPanel;
    pnl2: TPanel;
    pnl3: TPanel;
    lblValor: TLabel;
    edtValorTotal: TCurrencyEdit;
    Label2: TLabel;
    dbGridItensVenda: TDBGrid;
    lkpProduto: TDBLookupComboBox;
    lbl11: TLabel;
    edtValorUnitario: TCurrencyEdit;
    edtQuantidade: TCurrencyEdit;
    edtTotalProduto: TCurrencyEdit;
    lblData1: TLabel;
    lblData11: TLabel;
    lblData12: TLabel;
    btnAdicionarItem: TBitBtn;
    btnApagarItem: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dbGridItensVendaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnAlterarClick(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure btnAdicionarItemClick(Sender: TObject);
    procedure lkpProdutoExit(Sender: TObject);
    procedure edtQuantidadeExit(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure btnApagarItemClick(Sender: TObject);
    procedure dbGridItensVendaDblClick(Sender: TObject);
  private
    { Private declarations }
    dtmVendas:TdtmVendas;
    oVenda: TVenda;
    function Gravar(EstadoDoCadastro: TEstadoDoCadastro): Boolean; override;
    function Apagar: Boolean; override;
    function TotalizarProduto(valorUnitario, Quantidade: Double): Double;
    procedure LimparComponentesItem;
    procedure LimparCds;
    procedure CarregarRegistroSelecionado;
    function TotalizarVenda: Double;

  public
    { Public declarations }
  end;

var
  frmProVenda: TfrmProVenda;

implementation

{$R *.dfm}
{$REGION  'Override'}
function TfrmProVenda.Apagar: Boolean;
begin
  if oVenda.Selecionar(QryListagem.FieldByName('vendaId').AsInteger, dtmVendas.cdsItensVenda) then begin
    Result:=oVenda.Apagar;
  end;
end;

function TfrmProVenda.Gravar(EstadoDoCadastro: TEstadoDoCadastro): boolean;
begin
  Result:=False;
  if edtVendaId.Text<>EmptyStr then
     oVenda.VendaId:=StrToInt(edtVendaId.Text)
  else
     oVenda.VendaId:=0;

  oVenda.ClienteId        :=lkpCliente.KeyValue;
  oVenda.DataVenda        :=edtDataVenda.Date;
  oVenda.TotalVenda       :=edtValorTotal.Value;

  if (EstadoDoCadastro=ecInserir) then
    Result:=oVenda.Inserir(dtmVendas.cdsItensVenda)
  else if (EstadoDoCadastro=ecAlterar) then
    Result:=oVenda.Atualizar(dtmVendas.cdsItensVenda);

end;



procedure TfrmProVenda.lkpProdutoExit(Sender: TObject);
begin
  inherited;
  if TDBLookupComboBox(Sender).KeyValue<>Null then begin
  edtValorUnitario.Value:=dtmVendas.QryProdutos.FieldByName('valor').AsFloat;
  edtQuantidade.Value:=1;
  edtTotalProduto.Value:=TotalizarProduto(edtValorUnitario.Value, edtQuantidade.Value);
  end;
end;

{$ENDREGION}


procedure TfrmProVenda.btnAdicionarItemClick(Sender: TObject);
begin
  inherited;
  if lkpProduto.KeyValue=Null then begin
     MessageDlg('Produto é um campo obrigatório' ,mtInformation,[mbOK],0);
     lkpProduto.SetFocus;
     abort;
  end;

  if edtValorUnitario.value<=0 then begin
     MessageDlg('Valor Unitário não pode ser Zero' ,mtInformation,[mbOK],0);
     edtValorUnitario.SetFocus;
     abort;
  end;

  if edtQuantidade.value<=0 then begin
     MessageDlg('Quantidade não pode ser Zero' ,mtInformation,[mbOK],0);
     edtQuantidade.SetFocus;
     abort;
  end;

  if dtmVendas.cdsItensVenda.Locate('produtoId', lkpProduto.KeyValue, []) then begin
     MessageDlg('Este Produto já foi selecionado' ,mtInformation,[mbOK],0);
     lkpProduto.SetFocus;
     abort;
  end;

  edtTotalProduto.Value:=TotalizarProduto(edtValorUnitario.Value, edtQuantidade.Value);

  dtmVendas.cdsItensVenda.Append;
  dtmVendas.cdsItensVenda.FieldByName('produtoId').AsString:=lkpProduto.KeyValue;
  dtmVendas.cdsItensVenda.FieldByName('nomeProduto').AsString:=dtmVendas.QryProdutos.FieldByName('nome').AsString;
  dtmVendas.cdsItensVenda.FieldByName('quantidade').AsFloat:=edtQuantidade.Value;
  dtmVendas.cdsItensVenda.FieldByName('valorUnitario').AsFloat:=edtValorUnitario.Value;
  dtmVendas.cdsItensVenda.FieldByName('valorTotalProduto').AsFloat:=edtTotalProduto.Value;
  dtmVendas.cdsItensVenda.Post;
  edtValorTotal.Value:=TotalizarVenda;
  LimparComponentesItem;

  lkpProduto.SetFocus;

end;

procedure TfrmProVenda.LimparComponentesItem;
begin
  lkpProduto.KeyValue     := null;
  edtQuantidade.Value     :=0;
  edtValorUnitario.Value  :=0;
  edtTotalProduto.Value   :=0;

end;

function TfrmProVenda.TotalizarProduto(valorUnitario, Quantidade:Double):Double;
begin
  result:=valorUnitario * Quantidade;
end;

procedure TfrmProVenda.LimparCds;
begin
  dtmVendas.cdsItensVenda.First;
  while not dtmVendas.cdsItensVenda.Eof do
    dtmVendas.cdsItensVenda.Delete;
end;


procedure TfrmProVenda.btnAlterarClick(Sender: TObject);
begin
  if oVenda.Selecionar(QryListagem.FieldByName('vendaId').AsInteger, dtmVendas.cdsItensVenda) then begin
     edtVendaId.Text     :=IntToStr(oVenda.VendaId);
     lkpCliente.KeyValue :=oVenda.ClienteId;
     edtDataVenda.Date   :=oVenda.DataVenda;
     edtValorTotal.Value :=oVenda.TotalVenda;
  end
  else begin
    btnCancelar.Click;
    Abort;
  end;
  inherited;
end;


procedure TfrmProVenda.btnApagarItemClick(Sender: TObject);
begin
  inherited;
  if lkpProduto.KeyValue=null then begin
      MessageDlg('Selecione o produto a ser excluido' ,mtInformation, [mbOK], 0);
      dbGridItensVenda.SetFocus;
      Abort;
  end;

  if dtmVendas.cdsItensVenda.Locate('produtoId', lkpProduto.KeyValue, []) then begin
      dtmVendas.cdsItensVenda.Delete;
      edtValorTotal.Value:=TotalizarVenda;
      LimparComponentesItem;
  end;

end;

procedure TfrmProVenda.btnCancelarClick(Sender: TObject);
begin
  inherited;
  LimparCds;
end;

procedure TfrmProVenda.btnGravarClick(Sender: TObject);
begin
  inherited;
  LimparCds;
end;

procedure TfrmProVenda.btnNovoClick(Sender: TObject);
begin
  inherited;
  edtDataVenda.Date:=Date;
  lkpCliente.SetFocus;
  LimparCds;
end;

procedure TfrmProVenda.dbGridItensVendaDblClick(Sender: TObject);
begin
  inherited;
  CarregarRegistroSelecionado;
end;

procedure TfrmProVenda.dbGridItensVendaKeyDown(Sender: TObject; var Key: Word;Shift: TShiftState);
begin
  inherited;
  BloqueiaCTRL_DEL_DBGrid (Key,Shift);
end;

procedure TfrmProVenda.edtQuantidadeExit(Sender: TObject);
begin
  inherited;
  edtTotalProduto.Value:=TotalizarProduto(edtValorUnitario.Value, edtQuantidade.Value);
end;

procedure TfrmProVenda.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  if Assigned(dtmVendas) then
    FreeAndNil(dtmVendas);
  if Assigned(oVenda) then
    FreeAndNil(oVenda);

end;

procedure TfrmProVenda.FormCreate(Sender: TObject);
begin
  inherited;
  dtmVendas:=TdtmVendas.Create(self);
  oVenda:=TVenda.Create(dtmPrincipal.ConexaoDB);
  IndiceAtual:='clienteId';
end;

procedure TfrmProVenda.CarregarRegistroSelecionado;
begin
  lkpProduto.KeyValue     :=dtmVendas.cdsItensVenda.FieldByName('produtoId').AsString;
  edtQuantidade.Value     :=dtmVendas.cdsItensVenda.FieldByName('quantidade').AsFloat;
  edtValorUnitario.Value  :=dtmVendas.cdsItensVenda.FieldByName('valorUnitario').AsFloat;
  edtTotalProduto.Value   :=dtmVendas.cdsItensVenda.FieldByName('valorTotalProduto').AsFloat;
end;

function TfrmProVenda.TotalizarVenda:Double;

begin
  result:=0;
  dtmVendas.cdsItensVenda.First;
  while not dtmVendas.cdsItensVenda.Eof do begin
    result:=result + dtmVendas.cdsItensVenda.FieldByName('valorTotalProduto').AsFloat;
    dtmVendas.cdsItensVenda.Next;
  end;
end;

end.
