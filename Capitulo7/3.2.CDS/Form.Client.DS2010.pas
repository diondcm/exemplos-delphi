unit Form.Client.DS2010;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.ExtCtrls, Vcl.Grids, Vcl.DBGrids, Vcl.DBCtrls, Datasnap.DBClient, ClientModuleUnit1, Datasnap.DSConnect;

type
  TfrmClientDS2010 = class(TForm)
    navigator2010: TDBNavigator;
    gridDS2010: TDBGrid;
    timerOpen: TTimer;
    cdsDS2010: TClientDataSet;
    dtsDS2010: TDataSource;
    DSProviderConnection1: TDSProviderConnection;
    procedure FormShow(Sender: TObject);
    procedure timerOpenTimer(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmClientDS2010: TfrmClientDS2010;

implementation

{$R *.dfm}

procedure TfrmClientDS2010.FormShow(Sender: TObject);
begin
  timerOpen.Enabled := True;
end;

procedure TfrmClientDS2010.timerOpenTimer(Sender: TObject);
begin
  timerOpen.Enabled := False;
  cdsDS2010.Open;
end;

end.
