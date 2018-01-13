unit Form.Principal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error,
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, Vcl.DBCtrls, Vcl.ExtCtrls, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, FireDAC.Stan.StorageBin, Data.Win.ADODB, frxClass, frxDBSet;

type
  TfrmPrincipal = class(TForm)
    dtsImagem: TDataSource;
    panelImagem: TPanel;
    navImagem: TDBNavigator;
    ImageDB: TDBImage;
    ADOConnection: TADOConnection;
    qryBioLife: TADOQuery;
    frxDBBiolife: TfrxDBDataset;
    frxReport1: TfrxReport;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

end.
