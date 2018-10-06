unit Form.Principal;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls, Form.Base.Mobile, FMX.Layouts, FMX.Objects, FMX.Controls.Presentation, System.Actions, FMX.ActnList, Form.Action.Camera,
  Form.Dados;

type
  TfrmPrincipal = class(TfrmBaseMobile)
    LayoutButtons: TLayout;
    LayoutTitulo: TLayout;
    GridPanelLayout: TGridPanelLayout;
    BackgroundImage: TImage;
    Text1: TText;
    LayoutCheckIn: TLayout;
    Image1: TImage;
    Label1: TLabel;
    ActionList1: TActionList;
    ActionCamera: TAction;
    LayoutDados: TLayout;
    Image2: TImage;
    Label2: TLabel;
    LayoutScroll: TLayout;
    Image3: TImage;
    Label3: TLabel;
    procedure ActionCameraExecute(Sender: TObject);
    procedure Image1Click(Sender: TObject);
    procedure LayoutCheckInClick(Sender: TObject);
    procedure LayoutDadosClick(Sender: TObject);
    procedure LayoutScrollClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.fmx}

procedure TfrmPrincipal.ActionCameraExecute(Sender: TObject);
begin
  TfrmActionCamera.Create(Self).Show;
end;

procedure TfrmPrincipal.Image1Click(Sender: TObject);
begin
  inherited;
  ActionCamera.Execute;
end;

procedure TfrmPrincipal.LayoutCheckInClick(Sender: TObject);
begin
  inherited;
  ActionCamera.Execute;
end;

procedure TfrmPrincipal.LayoutDadosClick(Sender: TObject);
begin
  inherited;
  TfrmDados.Create(Self).Show;
end;

procedure TfrmPrincipal.LayoutScrollClick(Sender: TObject);
begin
  inherited;
  //
end;

end.
