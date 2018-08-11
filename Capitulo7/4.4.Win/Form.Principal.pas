unit Form.Principal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Form.Win.Classes, Form.Win.CriaClasse, Form.MonitoraDir;

type
  TfrmPrincipal = class(TForm)
    buttonClasses: TButton;
    buttonCriaForm: TButton;
    buttonMonitoraDir: TButton;
    procedure buttonClassesClick(Sender: TObject);
    procedure buttonCriaFormClick(Sender: TObject);
    procedure buttonMonitoraDirClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

procedure TfrmPrincipal.buttonClassesClick(Sender: TObject);
begin
  frmWinClasses.Show;
end;

procedure TfrmPrincipal.buttonCriaFormClick(Sender: TObject);
begin
  frmCriaClasse.Show;
end;

procedure TfrmPrincipal.buttonMonitoraDirClick(Sender: TObject);
begin
  frmMonitoraDir.Show;
end;

end.
