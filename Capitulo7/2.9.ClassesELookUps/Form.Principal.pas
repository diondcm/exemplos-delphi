unit Form.Principal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Form.Classes;

type
  TfrmPrincipal = class(TForm)
    buttonClasses: TButton;
    buttonLookup: TButton;
    procedure buttonClassesClick(Sender: TObject);
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
  frmClasses.Show;
end;

end.
