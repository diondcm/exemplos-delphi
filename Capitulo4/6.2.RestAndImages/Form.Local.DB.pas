unit Form.Local.DB;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.ListView.Types, FMX.ListView.Appearances,
  FMX.ListView.Adapters.Base, FMX.StdCtrls, FMX.ListView, FMX.Controls.Presentation;

type
  TfrmLocalDB = class(TForm)
    ToolBar1: TToolBar;
    ListView1: TListView;
    Button1: TButton;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmLocalDB: TfrmLocalDB;

implementation

{$R *.fmx}

end.
