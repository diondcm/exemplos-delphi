unit Form.Principal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, System.ImageList, Vcl.ImgList, System.Actions, Vcl.ActnList, Vcl.ToolWin, Form.Cadastro.Cliente;

type
  TfrmPrincipal = class(TForm)
    ToolBar: TToolBar;
    ActionList1: TActionList;
    ImageList1: TImageList;
    ToolButtonCliente: TToolButton;
    ActionCadCliente: TAction;
    procedure ActionCadClienteExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

procedure TfrmPrincipal.ActionCadClienteExecute(Sender: TObject);
begin
  frmCadCliente.Show;
end;

end.
