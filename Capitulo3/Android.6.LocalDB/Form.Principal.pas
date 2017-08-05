unit Form.Principal;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.StdCtrls,
  FMX.Controls.Presentation, Form.Login, Form.Config;

type
  TfrmPrincipal = class(TForm)
    ToolBar1: TToolBar;
    btnConfig: TButton;
    btnLogin: TButton;
    procedure btnLoginClick(Sender: TObject);
    procedure btnConfigClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.fmx}

procedure TfrmPrincipal.btnConfigClick(Sender: TObject);
begin
  frmConfig.Show;
end;

procedure TfrmPrincipal.btnLoginClick(Sender: TObject);
begin
  frmLogin.Show;
end;

end.
