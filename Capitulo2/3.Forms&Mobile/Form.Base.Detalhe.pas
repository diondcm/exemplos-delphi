unit Form.Base.Detalhe;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.StdCtrls,
  FMX.Controls.Presentation;

type
  TfrmBaseDetalhe = class(TForm)
    ToolBar1: TToolBar;
    Button1: TButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    FOnAfter: TProc;
  public
    { Public declarations }

    class procedure ShowEx(pBefore: TProc = nil; pAfter: TProc = nil);
  end;

implementation

{$R *.fmx}

procedure TfrmBaseDetalhe.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if Assigned(FOnAfter) then
    FOnAfter;

  Action := TCloseAction.cafree;
end;

class procedure TfrmBaseDetalhe.ShowEx(pBefore, pAfter: TProc);
var
  lFrm: TfrmBaseDetalhe;
begin
  lFrm := Self.Create(Application);
  if Assigned(pBefore) then
    pBefore;
  lFrm.FOnAfter := pAfter;
  lFrm.Show;
end;

end.
