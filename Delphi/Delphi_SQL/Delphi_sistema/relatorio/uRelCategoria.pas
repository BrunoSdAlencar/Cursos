unit uRelCategoria;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, ZAbstractRODataset,
  ZAbstractDataset, ZDataset, uDTMConexao, RLReport, RLFilters, RLPDFFilter;

type
  TfrmRelCategoria = class(TForm)
    QryCategorias: TZQuery;
    dtsCategorias: TDataSource;
    intgrfldQryCategoriascategoriaId: TIntegerField;
    wdstrngfldQryCategoriasdescricao: TWideStringField;
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
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRelCategoria: TfrmRelCategoria;

implementation


{$R *.dfm}

procedure TfrmRelCategoria.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  QryCategorias.Close;
end;

procedure TfrmRelCategoria.FormCreate(Sender: TObject);
begin
  QryCategorias.Open;
end;

end.
