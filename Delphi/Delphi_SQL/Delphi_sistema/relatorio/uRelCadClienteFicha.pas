unit uRelCadClienteFicha;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, ZAbstractRODataset,
  ZAbstractDataset, ZDataset, uDTMConexao, RLReport, RLFilters, RLPDFFilter,
  Vcl.Imaging.pngimage;

type
  TfrmRelCadClienteFicha = class(TForm)
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
    rldbtxtNome: TRLDBText;
    rldbtxtNome1: TRLDBText;
    intgrfldQryClienteclienteId: TIntegerField;
    wdstrngfldQryClientenome: TWideStringField;
    wdstrngfldQryClientecep: TWideStringField;
    wdstrngfldQryClienteendereco: TWideStringField;
    wdstrngfldQryClientebairro: TWideStringField;
    wdstrngfldQryClientecidade: TWideStringField;
    wdstrngfldQryClienteestado: TWideStringField;
    wdstrngfldQryClienteemail: TWideStringField;
    wdstrngfldQryClientetelefone: TWideStringField;
    dtmfldQryClientedataNascimento: TDateTimeField;
    rlbl41: TRLLabel;
    rlbl411: TRLLabel;
    rlbl4112: TRLLabel;
    rlbl4111: TRLLabel;
    rlbl4113: TRLLabel;
    rldbtxtNome2: TRLDBText;
    rldbtxtcep: TRLDBText;
    rlbl41131: TRLLabel;
    rlbl411311: TRLLabel;
    rldbtxtendereco: TRLDBText;
    rlbl4113111: TRLLabel;
    rldbtxtbairro: TRLDBText;
    rlbl4113112: TRLLabel;
    rldbtxtbairro1: TRLDBText;
    rlbl4113113: TRLLabel;
    rldbtxtbairro2: TRLDBText;
    rldrw12: TRLDraw;
    rlmg1: TRLImage;
    rlnglbl1: TRLAngleLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRelCadClienteFicha: TfrmRelCadClienteFicha;

implementation


{$R *.dfm}

procedure TfrmRelCadClienteFicha.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  QryCliente.Close;
end;

procedure TfrmRelCadClienteFicha.FormCreate(Sender: TObject);
begin
  QryCliente.Open;
end;

end.
