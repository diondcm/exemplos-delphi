unit Frame.Cliente;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  FMX.Edit, FMX.Controls.Presentation, FMX.Layouts;

type
  TfraCliente = class(TFrame)
    Layout: TLayout;
    Label1: TLabel;
    EditCliente: TEdit;
    ButtonConsultaSaldo: TButton;
    procedure ButtonConsultaSaldoClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.fmx}

procedure TfraCliente.ButtonConsultaSaldoClick(Sender: TObject);
begin
  ShowMessage(EditCliente.Text + ' com saldo de R$: ' + FormatFloat('0.,00', Random(999999)/(1 + Random(999))));
end;

end.
