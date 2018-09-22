unit Form.Principal.Gerais;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Layouts, FMX.Objects, FMX.Controls.Presentation, FMX.StdCtrls, Form.Download.Images;

type
  TfrmPrincipal = class(TForm)
    GridPanelLayout: TGridPanelLayout;
    RectangleLogo: TRectangle;
    ButtonDownImage: TCornerButton;
    procedure ButtonDownImageClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.fmx}

procedure TfrmPrincipal.ButtonDownImageClick(Sender: TObject);
begin
  TfrmDownloadImage.Create(Self).Show;
end;

end.
