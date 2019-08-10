unit Form.Exibe.Frame;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, Frame.Cliente,
  FMX.Controls.Presentation, FMX.StdCtrls;

type
  TfrmExibeFrame = class(TForm)
    fraCliente1: TfraCliente;
    ButtonShowCliente: TButton;
    procedure fraCliente2ButtonConsultaSaldoClick(Sender: TObject);
    procedure ButtonShowClienteClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmExibeFrame: TfrmExibeFrame;

implementation

{$R *.fmx}

procedure TfrmExibeFrame.ButtonShowClienteClick(Sender: TObject);
begin
  ShowMessage(fraCliente1.EditCliente.Text);
end;

procedure TfrmExibeFrame.fraCliente2ButtonConsultaSaldoClick(Sender: TObject);
begin
  fraCliente1.ButtonConsultaSaldoClick(Sender);

end;

end.
