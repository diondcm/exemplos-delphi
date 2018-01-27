unit Base.Form.Mobile;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, System.Actions, FMX.ActnList, FMX.StdCtrls,
  FMX.Controls.Presentation;

type
  TfrmBase = class;
  TMetodoCloseModal = reference to procedure (Sender: TfrmBase; pRetorno: Boolean);

  TfrmBase = class(TForm)
    ToolBar1: TToolBar;
    ActionList: TActionList;
    Button1: TButton;
    actClose: TAction;
    procedure actCloseExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    FOnCloseLikeModal: TMetodoCloseModal;
    FRetorno: Boolean;
  public
    property OnCloseLikeModal: TMetodoCloseModal read FOnCloseLikeModal write FOnCloseLikeModal;
    class procedure ExibeLikeModal(const pMetodoClose: TMetodoCloseModal);
  end;

implementation

{$R *.fmx}

procedure TfrmBase.actCloseExecute(Sender: TObject);
begin
  Close;
end;

class procedure TfrmBase.ExibeLikeModal(const pMetodoClose: TMetodoCloseModal);
var
  lFrm: TfrmBase;
begin
  lFrm := Self.Create(Application);
  lFrm.OnCloseLikeModal := pMetodoClose;
  lFrm.Show;
end;

procedure TfrmBase.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if Assigned(FOnCloseLikeModal) then
  begin
    FOnCloseLikeModal(Self, FRetorno);
  end;

  Action :=  TCloseAction.caFree;
end;

end.
