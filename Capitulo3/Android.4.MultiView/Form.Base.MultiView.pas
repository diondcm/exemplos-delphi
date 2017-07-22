unit Form.Base.MultiView;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Layouts;

type
  TfrmBaseMultiView = class(TForm)
    LayoutClient: TLayout;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmBaseMultiView: TfrmBaseMultiView;

implementation

{$R *.fmx}

end.
