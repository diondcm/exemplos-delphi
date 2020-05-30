unit Unit2;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DBXDataSnap, Data.DBXCommon, IPPeerClient, Data.DB, Datasnap.DBClient, Data.SqlExpr, Datasnap.DSConnect;

type
  TForm2 = class(TForm)
    DSProviderConnection1: TDSProviderConnection;
    SQLConnection1: TSQLConnection;
    ClientDataSet1: TClientDataSet;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

{$R *.dfm}

end.
