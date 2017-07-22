unit Form.Principal;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  Form.Base, FMX.Layouts, FMX.Controls.Presentation, FMX.Objects,
  Form.Mapa.Browser, Form.Mapa.MapView;

type
  TfrmPrincipal = class(TfrmBase)
    GridPanelLayout1: TGridPanelLayout;
    Image1: TImage;
    btnMapa: TButton;
    btnMapView: TButton;
    btnClose: TButton;
    StyleBook1: TStyleBook;
    procedure btnMapaClick(Sender: TObject);
    procedure btnMapViewClick(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.fmx}

procedure TfrmPrincipal.btnCloseClick(Sender: TObject);
begin
  inherited;
  Close;
end;

procedure TfrmPrincipal.btnMapaClick(Sender: TObject);
var
  lFrm: TfrmMapaBrowser;
begin
  lFrm := TfrmMapaBrowser.Create(Application);
  lFrm.ShowLikeModal(
    procedure (Sender: TfrmBase)
    begin
      Self.Show;
    end);
end;

procedure TfrmPrincipal.btnMapViewClick(Sender: TObject);
begin
  inherited;
  TfrmMapView.Create(Application).ShowLikeModal(
    procedure (Sender: TfrmBase)
    begin
      Self.Show;
    end);
end;

end.
