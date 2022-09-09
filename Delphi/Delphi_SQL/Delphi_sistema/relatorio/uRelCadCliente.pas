unit uRelCadCliente;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, ZAbstractRODataset,
  ZAbstractDataset, ZDataset, uDTMConexao, RLReport, RLFilters, RLPDFFilter;

type
  TfrmRelCadCliente = class(TForm)
    QryCliente: TZQuery;
    dtsCliente: TDataSource;
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
    intgrfldQryClienteclienteId: TIntegerField;
    wdstrngfldQryClienteNome: TWideStringField;
    wdstrngfldQryClienteemail: TWideStringField;
    wdstrngfldQryClientetelefone: TWideStringField;
    rldbtxtNome: TRLDBText;
    rldbtxtNome1: TRLDBText;
    rlbl4111: TRLLabel;
    rlbl4112: TRLLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRelCadCliente: TfrmRelCadCliente;

implementation


{$R *.dfm}

procedure TfrmRelCadCliente.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  QryCliente.Close;
end;

procedure TfrmRelCadCliente.FormCreate(Sender: TObject);
begin
  QryCliente.Open;
end;

end.
