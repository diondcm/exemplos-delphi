unit Form.Principal.Forms;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls, Form.Base, FMX.Controls.Presentation, FMX.Layouts, FMX.Objects, Form.Mapa.Browser, Form.Map.View;

type
  TfrmPrincipalForms = class(TfrmBase)
    GridPanelLayout: TGridPanelLayout;
    Image1: TImage;
    buttonWebBrowser: TButton;
    StyleBook1: TStyleBook;
    buttonMapView: TButton;
    procedure buttonWebBrowserClick(Sender: TObject);
    procedure buttonMapViewClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrincipalForms: TfrmPrincipalForms;

implementation

{$R *.fmx}

procedure TfrmPrincipalForms.buttonMapViewClick(Sender: TObject);
var
  lFrm: TfrmMapView;
begin
  lFrm := TfrmMapView.Create(Self);
  lFrm.ShowLikeModal(nil);
end;

procedure TfrmPrincipalForms.buttonWebBrowserClick(Sender: TObject);
var
  lFrm: TfrmMapaBrowser;
begin
  lFrm := TfrmMapaBrowser.Create(Self);
//  lFrm.ShowModal(
//    procedure(MResult: TModalResult)
//    begin
////      lfrm.editURL.Text
//    end);

  lFrm.ShowLikeModal(
    procedure(Sender: TFrmBase)
    begin
      Self.Show; // avaliar
    end);
end;

end.
