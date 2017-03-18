unit Form.Custom.Adapter;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.StdCtrls,
  FMX.ListView, FMX.ListView.Types, FMX.ListView.Adapters.Base, System.SyncObjs,
  FMX.Controls.Presentation, FMX.Layouts, System.Generics.Collections, System.RegularExpressions,
  FMX.Objects, Classe.Custom.Adapter;

type
  TfrmCustomAdapter = class(TForm)
    ToolBar1: TToolBar;
    btnRetornar: TButton;
    lytPrincipal: TLayout;
    procedure btnRetornarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private const
    HOST = 'http://i.imgur.com/';

  private
    FListView: TListViewBase;
    FStrings: TStringList;
    FTotal: Integer;
    FAdapter: TAdapterCustomizado;

    procedure AddItens(pQtd: Integer);
  public
    { Public declarations }
  end;


var
  frmCustomAdapter: TfrmCustomAdapter;

implementation

{$R *.fmx}

procedure TfrmCustomAdapter.AddItens(pQtd: Integer);
var
  i: Integer;
begin
  for i := 0 to pQtd -1 do
  begin
    FStrings.Add('Item ' + IntToStr(i));
  end;
end;

procedure TfrmCustomAdapter.btnRetornarClick(Sender: TObject);
begin
  Hide;
end;

procedure TfrmCustomAdapter.FormCreate(Sender: TObject);
begin
  FListView := TPresentedListView.Create(Self);
  FListView.ControlType := TControlType.Platform;

  FStrings := TStringList.Create;

  FAdapter := TAdapterCustomizado.Create(FListView, FStrings);
  FListView.Adapter := FAdapter;

  FListView.Parent := lytPrincipal;
  FListView.Align := TAlignLayout.Client;

//  FListView.PullToRefresh := True;
//  FListView.PullRefreshWait := True;
  //
end;

procedure TfrmCustomAdapter.FormDestroy(Sender: TObject);
begin
  FStrings.Free;
end;

procedure TfrmCustomAdapter.FormShow(Sender: TObject);
begin
  TThread.Queue(nil,
    procedure
    begin
      AddItens(30);
    end);
end;

end.
