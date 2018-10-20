unit Form.Principal;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Layouts, FMX.Controls.Presentation, FMX.StdCtrls, FMX.Objects, Form.Notification, Form.FireBase;

type
  TfrmPrincipal = class(TForm)
    GridPanelLayout1: TGridPanelLayout;
    ImageLogo: TImage;
    ButtonNotification: TCornerButton;
    ButtonFireBase: TCornerButton;
    procedure ButtonNotificationClick(Sender: TObject);
    procedure ButtonFireBaseClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.fmx}

procedure TfrmPrincipal.ButtonFireBaseClick(Sender: TObject);
begin
  frmFireBase.Show;
end;

procedure TfrmPrincipal.ButtonNotificationClick(Sender: TObject);
begin
  frmNotification.Show;
end;

end.
