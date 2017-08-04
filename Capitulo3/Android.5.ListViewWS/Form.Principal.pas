unit Form.Principal;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Layouts;

type
  TfrmListView = class(TForm)
    LayoutListView: TLayout;
    tmrLoadImages: TTimer;
    procedure tmrLoadImagesTimer(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    FImagesLoaded: Boolean;
  public
    { Public declarations }
  end;

var
  frmListView: TfrmListView;

implementation

{$R *.fmx}

procedure TfrmListView.FormShow(Sender: TObject);
begin
  if not FImagesLoaded then
  begin
    FImagesLoaded := True;
    tmrLoadImages.Enabled := True;
  end;
end;

procedure TfrmListView.tmrLoadImagesTimer(Sender: TObject);
begin
  tmrLoadImages.Enabled := False;
  //
end;

end.
