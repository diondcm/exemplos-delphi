unit Form.MultiView.Mensagem;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  Form.MultiView.Base, FMX.Layouts, FMX.Objects, FMX.Controls.Presentation, FMX.DialogService;

type
  TfrmMultiViewMensagem = class(TfrmBaseMultiView)
    ButtonAviso: TButton;
    Label1: TLabel;
    Rectangle1: TRectangle;
    procedure ButtonAvisoClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMultiViewMensagem: TfrmMultiViewMensagem;

implementation

{$R *.fmx}

procedure TfrmMultiViewMensagem.ButtonAvisoClick(Sender: TObject);
begin
  TDialogService.MessageDialog('Fechar a tela?', TMsgDlgType.mtConfirmation, [TMsgDlgBtn.mbYes, TMsgDlgBtn.mbNo],
    TMsgDlgBtn.mbNo, 0,
    procedure (const AResult: TModalResult)
    begin
      case AResult of
        mrYes: Close; // Free;
      else
        TDialogService.ShowMessage('Ok, continue aqui então.');
      end;
    end);
end;

end.
