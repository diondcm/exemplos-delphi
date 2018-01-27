unit Form.Principal;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Edit, FMX.Controls.Presentation, FMX.StdCtrls,
  Form.Tabs;

type
  TfrmPrincipal = class(TForm)
    buttonOla: TButton;
    editNome: TEdit;
    buttonTabs: TButton;
    procedure buttonOlaClick(Sender: TObject);
    procedure buttonTabsClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.fmx}

procedure TfrmPrincipal.buttonOlaClick(Sender: TObject);
begin
  ShowMessage('Olá ' + editNome.Text);
end;

procedure TfrmPrincipal.buttonTabsClick(Sender: TObject);
begin
  frmTabs.Show;
end;

end.
