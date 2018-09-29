unit Form.Principal;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls, Form.Base.Mobile, FMX.Layouts, FMX.Objects;

type
  TfrmPrincipal = class(TfrmBaseMobile)
    LayoutButtons: TLayout;
    LayoutTitulo: TLayout;
    GridPanelLayout: TGridPanelLayout;
    BackgroundImage: TImage;
    Text1: TText;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.fmx}

end.
