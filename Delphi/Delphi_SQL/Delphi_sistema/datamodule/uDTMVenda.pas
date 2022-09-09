unit uDTMVenda;

interface

uses
  System.SysUtils, System.Classes, Data.DB, ZAbstractRODataset,
  ZAbstractDataset, ZDataset, Datasnap.DBClient;

type
  TdtmVendas = class(TDataModule)
    QryCliente: TZQuery;
    QryProdutos: TZQuery;
    QryProdutosprodutoId: TIntegerField;
    QryProdutosnome: TWideStringField;
    QryProdutosvalor: TFloatField;
    QryProdutosquantidade: TFloatField;
    cdsItensVenda: TClientDataSet;
    dtsCliente: TDataSource;
    dtsProdutos: TDataSource;
    dtsItensVenda: TDataSource;
    cdsItensVendaprodutoId: TIntegerField;
    cdsItensVendaNomeProduto: TStringField;
    cdsItensVendaQuantidade: TFloatField;
    cdsItensVendavalorUnitario: TFloatField;
    cdsItensVendavalorTotalProduto: TFloatField;
    intgrfldQryClienteclienteId: TIntegerField;
    wdstrngfldQryClientenome: TWideStringField;
    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dtmVendas: TdtmVendas;

implementation

uses
  uDTMConexao;

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

procedure TdtmVendas.DataModuleCreate(Sender: TObject);
begin
  cdsItensVenda.CreateDataSet;
  QryCliente.Open;
  QryProdutos.Open;
end;

procedure TdtmVendas.DataModuleDestroy(Sender: TObject);
begin
  cdsItensVenda.Close;
  QryCliente.Close;
  QryProdutos.Close;
end;




end.
