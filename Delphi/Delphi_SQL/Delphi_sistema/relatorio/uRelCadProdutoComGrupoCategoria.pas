unit uRelCadProdutoComGrupoCategoria;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, ZAbstractRODataset,
  ZAbstractDataset, ZDataset, uDTMConexao, RLReport, RLFilters, RLPDFFilter;

type
  TfrmRelCadProdutoComGrupoCategoria = class(TForm)
    QryProdutos: TZQuery;
    dtsProdutos: TDataSource;
    Relatorio: TRLReport;
    Cabecario: TRLBand;
    rlbl1: TRLLabel;
    rldrw1: TRLDraw;
    rlpdfltr1: TRLPDFFilter;
    RLBand1: TRLBand;
    rldrw11: TRLDraw;
    rlsystmnf1: TRLSystemInfo;
    rlsystmnf11: TRLSystemInfo;
    rlsystmnf111: TRLSystemInfo;
    rlbl2: TRLLabel;
    rlbl3: TRLLabel;
    RLBand2: TRLBand;
    rldbtxtcategoriaId: TRLDBText;
    rldbtxtcategoriaId1: TRLDBText;
    RLBand3: TRLBand;
    rlpnl1: TRLPanel;
    rlbl411: TRLLabel;
    rlbl41: TRLLabel;
    QryProdutosprodutoId: TIntegerField;
    QryProdutosnome: TWideStringField;
    QryProdutosvalor: TFloatField;
    QryProdutosquantidade: TFloatField;
    rlbl4111: TRLLabel;
    rlbl4112: TRLLabel;
    rldbtxtnome: TRLDBText;
    rldbtxtnome1: TRLDBText;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRelCadProdutoComGrupoCategoria: TfrmRelCadProdutoComGrupoCategoria;

implementation


{$R *.dfm}

procedure TfrmRelCadProdutoComGrupoCategoria.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  QryProdutos.Close;
end;

procedure TfrmRelCadProdutoComGrupoCategoria.FormCreate(Sender: TObject);
begin
  QryProdutos.Open;
end;

end.
