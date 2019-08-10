unit Form.MultiView.Base;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Layouts;

type
  TfrmBaseMultiView = class;

  TOnCloseMultiView = reference to procedure (pForm: TfrmBaseMultiView);

  TfrmBaseMultiView = class(TForm)
    LayoutClient: TLayout;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    FOnCloseProc: TOnCloseMultiView;
  public
    property OnCloseProc: TOnCloseMultiView read FOnCloseProc write FOnCloseProc;
  end;

var
  frmBaseMultiView: TfrmBaseMultiView;

implementation

{$R *.fmx}

procedure TfrmBaseMultiView.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if Assigned(FOnCloseProc) then
  begin
    FOnCloseProc(Self);
  end;
end;

end.
