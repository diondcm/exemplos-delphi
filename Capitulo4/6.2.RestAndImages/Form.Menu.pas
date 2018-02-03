unit Form.Menu;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Layouts, FMX.Objects, FMX.Controls.Presentation,
  FMX.StdCtrls, Form.RESTGetImage;

type
  TfrmMenu = class(TForm)
    GridPanelLayout: TGridPanelLayout;
    buttonImagemFromRest: TButton;
    Image1: TImage;
    procedure buttonImagemFromRestClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMenu: TfrmMenu;

implementation

{$R *.fmx}

procedure TfrmMenu.buttonImagemFromRestClick(Sender: TObject);
begin
  TfrmRESTGetImage.Create(Application).Show;
end;

end.
