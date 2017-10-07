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
    BackdropSource: TImage;
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
    procedure PullRefresh(Sender: TObject);
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

const
  { NÃO utilizar "const: = " -> constante tipada, gera leaks de memória }
  Produtos: array [0..6] of string =
    ('gbLSXNc.jpg', // 'SpCbHBI.jpg',
     'ZQovp9q.jpg', // 'aMlUpJB.jpg',
     'cswTE99.jpg', // 'fmXnXWn.png',
     '4r2JZa0.jpg', // 'IWSnWNt.jpg',
     'xkbX2V2.jpg', // 'QgA69dC.png'
     'QIdZVhT.jpg',
     'ymlOiDw.jpg'
     );

  Names: array [0..9] of string =
    ('Ouro', 'Prata', 'Ametista', 'Quartz', 'Rubi', 'Casa', 'Pedra', 'Carvão', 'Cascalho', 'Brita');

  function NextItemText: string;
  begin
    Result := Format('[%d] [%s] [%s%s]', [FTotal, Names[FTotal mod Length(Names)], HOST, Produtos[FTotal mod Length(Produtos)]]);
    Inc(FTotal);
  end;

begin
  for i := 0 to pQtd -1 do
  begin
    FStrings.Add(NextItemText);
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
  FAdapter.BackdropImage := BackdropSource;
  FListView.Adapter := FAdapter;

  FListView.Parent := lytPrincipal;
  FListView.Align := TAlignLayout.Client;

  FListView.PullToRefresh := True;
  FListView.PullRefreshWait := True;
  FListView.OnPullRefresh := PullRefresh;
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

procedure TfrmCustomAdapter.PullRefresh(Sender: TObject);
begin
  AddItens(30);
end;

end.
