unit Form.Sobre;

interface

uses WinApi.Windows, System.SysUtils, System.Classes, Vcl.Graphics,
  Vcl.Forms, Vcl.Controls, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls;

type
  TfrmSobre = class(TForm)
    Panel1: TPanel;
    ProgramIcon: TImage;
    ProductName: TLabel;
    Version: TLabel;
    Copyright: TLabel;
    Comments: TLabel;
    OKButton: TButton;
  private
    { Private declarations }
  public
    class procedure Exibir;
  end;

implementation

{$R *.dfm}

{ TfrmSobre }

class procedure TfrmSobre.Exibir;
begin
  TfrmSobre.Create(Application).ShowModal;
end;

end.
 
