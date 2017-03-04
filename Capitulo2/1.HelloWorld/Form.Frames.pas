unit Form.Frames;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.TabControl,
  Frame.Mensagem, System.Actions, FMX.ActnList, FMX.Gestures;

type
  TfrmFrames = class(TForm)
    tbcPrincipal: TTabControl;
    tab1: TTabItem;
    tab2: TTabItem;
    tab3: TTabItem;
    fraMensagem1: TfraMensagem;
    fraMensagem2: TfraMensagem;
    fraMensagem3: TfraMensagem;
    GestureManager1: TGestureManager;
    ActionList1: TActionList;
    actShowTab2: TAction;
    procedure FormCreate(Sender: TObject);
    procedure actShowTab2Execute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmFrames: TfrmFrames;

implementation

{$R *.fmx}

procedure TfrmFrames.actShowTab2Execute(Sender: TObject);
begin
  tbcPrincipal.ActiveTab := tab2;
end;

procedure TfrmFrames.FormCreate(Sender: TObject);
begin
  tbcPrincipal.ActiveTab := tab1;
  fraMensagem1.Mensagem := 'Este é o frame 1';
  fraMensagem2.Mensagem := 'Frame 2 é este';
  fraMensagem3.Mensagem := 'Mais do mesmo no 3º';
end;

end.
